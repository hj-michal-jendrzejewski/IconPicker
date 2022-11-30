//
//  SwiftUIView.swift
//  
//
//  Created by Michal Jendrzejewski on 27/01/2022.
//

import SwiftUI

struct IconsSectionHeader: ViewModifier {
    
    
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundColor(SelectedThemeColors2().bgMainColour)
            .padding(5)
    }
}

extension View {
    func iconsSectionHeaderStyle() -> some View {
        self.modifier(IconsSectionHeader())
    }
}

struct SmartIconsSectionHeader: ViewModifier {
    
    
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundColor(SelectedThemeColors2().bgMainColour)
            .padding(5)
            .background(SelectedThemeColors2().fontMainColour.opacity(0.6))
            .cornerRadius(5)
    }
}

extension View {
    func smartIconsSectionHeaderStyle() -> some View {
        self.modifier(SmartIconsSectionHeader())
    }
}

struct DashedProgressViewStyle: ProgressViewStyle {
    let dashSize = [CGFloat(20), CGFloat(3)]
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            GeometryReader { geometry in
                
                Path{ path in
                    path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 2))
                }
                .stroke(style: StrokeStyle( lineWidth: 2,lineCap: .round,  dash: [geometry.size.width / 5 - 3, CGFloat(3)]))
                .foregroundColor(Color.gray.opacity(0.5))
                
                Path{ path in
                    path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                    path.addLine(to: CGPoint(x: CGFloat(Double(geometry.size.width) * configuration.fractionCompleted!), y: geometry.size.height / 2))
                }
                .stroke(style: StrokeStyle( lineWidth: 2, lineCap: .round, dash: [geometry.size.width / 5 - 3, CGFloat(3)]))
                .foregroundColor(Color.white.opacity(0.5))
                
            }
        }
        .frame(height: 1)
    }
}

struct DashedProgressViewStyleWithClickableBar: ProgressViewStyle {
    @Binding var scrolledToCategoryName: String
    var visibleCategoryName: String
    var dashTapAction: (_ scrollToId: String) -> Void
    
    @State var hoverState: [Bool] = [false, false, false, false, false]
    
    let dashSize = [CGFloat(20), CGFloat(3)]
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            
            GeometryReader { geometry in
                
                Path{ path in
                    path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                    path.addLine(to: CGPoint(x: CGFloat(Double(geometry.size.width) * configuration.fractionCompleted!), y: geometry.size.height / 2))
                }
                .stroke(style: StrokeStyle( lineWidth: 5, lineCap: .round, dash: [geometry.size.width / 5 - 3, CGFloat(3)]))
                .foregroundColor(Color.white)
                
                HStack(alignment: .center, spacing: 5) {

                    
                    ForEach(0..<5) { number in
                        
                        Button(action: {dashTapAction(visibleCategoryName + String(number))}) {
                            Color.gray.opacity(0.5)
                        }
                        .frame(width: 40, height: hoverState[number] == true ? 10 : 5, alignment: .top)
                        .border(Color.white)
                        .onHover(perform: { hover in
                                                        hoverState[number] = hover
                                                    })
                    }
                }
            }
        }
        .frame(height: 1)
    }
}

struct DottedProgressViewStyle: ProgressViewStyle {
    
    @State var dotsWidth:[CGFloat]
    @State var dotsOpacity:[Double]
    @State var fractionCompletedDotsRanges:Dictionary<MyRange, String>
    
    //visual configuration of dots
    let dotsNumber = 5.0
    let initialDotWidth = 3
    let maxDotWidth = CGFloat(10)
    let initialDotOpacity:Double = 0.3
    let maxDotOpacity:Double = 0.6
    let oneDotRangeLength:Double
    
    init() {
        var fractionCompletedDotsRanges:Dictionary<MyRange, String> = Dictionary<MyRange, String>()
        self.oneDotRangeLength = Double(1.0/dotsNumber)
        
        
        for index in 0..<Int(dotsNumber) {
            let rangeStart:Double = Double(index) * oneDotRangeLength
            let rangeEnd:Double = Double(index) * oneDotRangeLength + oneDotRangeLength
            
            fractionCompletedDotsRanges[MyRange(range: rangeStart..<rangeEnd)] = String(index)
        }
        
        
        _fractionCompletedDotsRanges = State(initialValue: fractionCompletedDotsRanges)
        _dotsWidth = State(initialValue: Array(repeating: CGFloat(initialDotWidth), count: Int(dotsNumber)))
        _dotsOpacity = State(initialValue: Array(repeating: initialDotOpacity, count: Int(dotsNumber)))
    }
    
    
//    func getDotSize(dotNumber: Int) -> CGFloat {
//
//    }
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            
            ForEach(0 ..< Int(dotsNumber)) { index in
                VStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: self.dotsWidth[index])
                        .opacity(self.dotsOpacity[index])
                }
                .frame(width: 10, height: 10)
            }
        }
        .onChange(of: configuration.fractionCompleted, perform: { value in
            
            // reset all dots to initial state when fractionCompleted drops from 1 to 0
            if value! < 0.0507 {
                self.dotsWidth = Array(repeating: CGFloat(initialDotWidth), count: Int(dotsNumber))
                self.dotsOpacity = Array(repeating: initialDotOpacity, count: Int(dotsNumber))
            }
            
            // set all dots to full state when fractionCompleted drops from 0 to 1
            if value! > 0.95 {
                self.dotsWidth = Array(repeating: maxDotWidth, count: Int(dotsNumber))
                self.dotsOpacity = Array(repeating: maxDotOpacity, count: Int(dotsNumber))
            }
            
            let fractionCompletedRangeDotIndex = Int(self.fractionCompletedDotsRanges[Double(value!)][0])!
            let dotFilledPercentage = (value! - Double(fractionCompletedRangeDotIndex) * self.oneDotRangeLength) / self.oneDotRangeLength
            
            self.dotsWidth[fractionCompletedRangeDotIndex] = CGFloat(Double(initialDotWidth) + 10 * dotFilledPercentage)
            self.dotsOpacity[fractionCompletedRangeDotIndex] = initialDotOpacity + 0.3 * dotFilledPercentage
        })
    }
}

struct DashedProgressViewWithVariableDashesNumberStyle: ProgressViewStyle {
    var iconsCategoriesProgressBarsSizes:[String: CGFloat]
    var visibleCategoryName:String
    
    @State var dotsWidth:[CGFloat]
    @State var dotsOpacity:[Double]
    @State var fractionCompletedDotsRanges:Dictionary<MyRange, String>
    @State var categoryWidthRangesToDotsNumber:Dictionary<MyRange, String>
    @State var dotsNumber = 5.0
    @State var fractionCompleted = 0.0
    
    //visual configuration of dots
    
    let minimumDotsNumber = 2
    let maximumDotsNumber = 6
    let initialDotWidth = 3
    let maxDotWidth = CGFloat(10)
    let initialDotOpacity:Double = 0.3
    let maxDotOpacity:Double = 0.6
    let oneDotRangeLength:Double
    let spacesBetweenDashesWidth = CGFloat(6)
    
    init(iconsCategoriesProgressBarsSizes:[String: CGFloat], visibleCategoryName:String) {
        self.iconsCategoriesProgressBarsSizes = iconsCategoriesProgressBarsSizes
        
        
        self.visibleCategoryName = visibleCategoryName
        
        var dotsNumber = 0.0
        
        
        // prepare how many dots should be displayed depending on visible category width
        var categoryWidthRangesToDotsNumber:Dictionary<MyRange, String> = Dictionary<MyRange, String>()
        let shortesCategoryWidth = iconsCategoriesProgressBarsSizes.values.min()
        let longestCategoryWidth = iconsCategoriesProgressBarsSizes.values.max()
        let oneDashWidth = Double(longestCategoryWidth! - shortesCategoryWidth!) / Double(maximumDotsNumber - minimumDotsNumber - 1)
        
        categoryWidthRangesToDotsNumber[MyRange(range: 0..<Double(shortesCategoryWidth! + 1))] = String(minimumDotsNumber)
        categoryWidthRangesToDotsNumber[MyRange(range: Double(longestCategoryWidth!)..<Double(longestCategoryWidth! + 1))] = String(maximumDotsNumber)
        
        for index in 0..<maximumDotsNumber - minimumDotsNumber - 1 {
            let rangeLowerBound = 1 + Int(shortesCategoryWidth!) + Int(oneDashWidth) * index
            var rangeHigherBound = 0
            if index == maximumDotsNumber - minimumDotsNumber - 2 {
                rangeHigherBound = Int(shortesCategoryWidth!) + (Int(oneDashWidth) * index) + Int(oneDashWidth)
            } else {
                rangeHigherBound = Int(shortesCategoryWidth!) + (Int(oneDashWidth) * index) + Int(oneDashWidth) + 1
            }
            
            categoryWidthRangesToDotsNumber[MyRange(range: Double(rangeLowerBound)..<Double(rangeHigherBound))] = String(index + minimumDotsNumber + 1)
        }
        
        _categoryWidthRangesToDotsNumber = State(initialValue: categoryWidthRangesToDotsNumber)
        // END prepare how many dots should be displayed depending on visible category width
 
        dotsNumber = Double(categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[visibleCategoryName]!)][0])!
        _dotsNumber = State(initialValue: dotsNumber)
        
        self.oneDotRangeLength = Double(1.0/dotsNumber)
        
        _dotsWidth = State(initialValue: Array(repeating: CGFloat(initialDotWidth), count: Int(dotsNumber)))
        _dotsOpacity = State(initialValue: Array(repeating: initialDotOpacity, count: Int(dotsNumber)))
        
        // prepare fractionCompleted ranges so that the correct dot changes its size and opacity
        var fractionCompletedDotsRanges:Dictionary<MyRange, String> = Dictionary<MyRange, String>()
        
        for index in 0..<Int(dotsNumber) {
            let rangeStart:Double = Double(index) * oneDotRangeLength
            let rangeEnd:Double = Double(index) * oneDotRangeLength + oneDotRangeLength
            
            fractionCompletedDotsRanges[MyRange(range: rangeStart..<rangeEnd)] = String(index)
        }
        
        _fractionCompletedDotsRanges = State(initialValue: fractionCompletedDotsRanges)
    }
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            
            GeometryReader { geometry in
                
                Path{ path in
                    path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height / 2))
                }
                .stroke(style: StrokeStyle( lineWidth: 2,lineCap: .round,  dash: [geometry.size.width / CGFloat(self.dotsNumber) - spacesBetweenDashesWidth, CGFloat(spacesBetweenDashesWidth)]))
                .foregroundColor(Color.gray.opacity(0.5))
                
                Path{ path in
                    path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                    path.addLine(to: CGPoint(x: CGFloat(Double(geometry.size.width) * configuration.fractionCompleted!), y: geometry.size.height / 2))
                }
                .stroke(style: StrokeStyle( lineWidth: 2, lineCap: .round, dash: [geometry.size.width / CGFloat(self.dotsNumber) - spacesBetweenDashesWidth, CGFloat(spacesBetweenDashesWidth)]))
                .foregroundColor(Color.white.opacity(0.5))
                
            }
            .onChange(of: self.visibleCategoryName, perform: { value in
               
                                    if self.fractionCompleted < 0.0507 {
                                        self.dotsWidth = Array(repeating: CGFloat(initialDotWidth), count: Int(Double(self.categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[value]!)][0])!))
                                        self.dotsOpacity = Array(repeating: initialDotOpacity, count: Int(Double(self.categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[value]!)][0])!))
                                    }
            
                                    if self.fractionCompleted > 0.95 {
                                        self.dotsWidth = Array(repeating: maxDotWidth, count: Int(Double(self.categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[value]!)][0])!))
                                        self.dotsOpacity = Array(repeating: maxDotOpacity, count: Int(Double(self.categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[value]!)][0])!))
                                    }
            
                                    self.dotsNumber = Double(self.categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[value]!)][0])!
                                })
            .onChange(of: configuration.fractionCompleted, perform: { value in
                
                self.fractionCompleted = value!
                if value! > 0.0507 && value! < 0.95 {
                let fractionCompletedRangeDotIndex = Int(self.fractionCompletedDotsRanges[Double(value!)][0])!
                let dotFilledPercentage = (value! - Double(fractionCompletedRangeDotIndex) * self.oneDotRangeLength) / self.oneDotRangeLength

                self.dotsWidth[fractionCompletedRangeDotIndex] = CGFloat(Double(initialDotWidth) + 10 * dotFilledPercentage)
                self.dotsOpacity[fractionCompletedRangeDotIndex] = initialDotOpacity + 0.3 * dotFilledPercentage
                }
        })
        }
    }
}

struct DottedProgressViewWithVariableDotsNumberStyle: ProgressViewStyle {
    var iconsCategoriesProgressBarsSizes:[String: CGFloat]
    var visibleCategoryName:String
    
    @State var dotsWidth:[CGFloat]
    @State var dotsOpacity:[Double]
    @State var fractionCompletedDotsRanges:Dictionary<MyRange, String>
    @State var categoryWidthRangesToDotsNumber:Dictionary<MyRange, String>
    @State var dotsNumber = 5.0
    @State var fractionCompleted = 0.0
    
    //visual configuration of dots
    
    let minimumDotsNumber = 2
    let maximumDotsNumber = 6
    let initialDotWidth = 3
    let maxDotWidth = CGFloat(10)
    let initialDotOpacity:Double = 0.3
    let maxDotOpacity:Double = 0.6
    let oneDotRangeLength:Double
    
    init(iconsCategoriesProgressBarsSizes:[String: CGFloat], visibleCategoryName:String) {
        self.iconsCategoriesProgressBarsSizes = iconsCategoriesProgressBarsSizes
        
        
        self.visibleCategoryName = visibleCategoryName
        
        var dotsNumber = 0.0
        
        
        // prepare how many dots should be displayed depending on visible category width
        var categoryWidthRangesToDotsNumber:Dictionary<MyRange, String> = Dictionary<MyRange, String>()
        let shortesCategoryWidth = iconsCategoriesProgressBarsSizes.values.min()
        let longestCategoryWidth = iconsCategoriesProgressBarsSizes.values.max()
        let oneDashWidth = Double(longestCategoryWidth! - shortesCategoryWidth!) / Double(maximumDotsNumber - minimumDotsNumber - 1)
        
        categoryWidthRangesToDotsNumber[MyRange(range: 0..<Double(shortesCategoryWidth! + 1))] = String(minimumDotsNumber)
        categoryWidthRangesToDotsNumber[MyRange(range: Double(longestCategoryWidth!)..<Double(longestCategoryWidth! + 1))] = String(maximumDotsNumber)
        
        for index in 0..<maximumDotsNumber - minimumDotsNumber - 1 {
            let rangeLowerBound = 1 + Int(shortesCategoryWidth!) + Int(oneDashWidth) * index
            var rangeHigherBound = 0
            if index == maximumDotsNumber - minimumDotsNumber - 2 {
                rangeHigherBound = Int(shortesCategoryWidth!) + (Int(oneDashWidth) * index) + Int(oneDashWidth)
            } else {
                rangeHigherBound = Int(shortesCategoryWidth!) + (Int(oneDashWidth) * index) + Int(oneDashWidth) + 1
            }
            
            categoryWidthRangesToDotsNumber[MyRange(range: Double(rangeLowerBound)..<Double(rangeHigherBound))] = String(index + minimumDotsNumber + 1)
        }
        
        _categoryWidthRangesToDotsNumber = State(initialValue: categoryWidthRangesToDotsNumber)
        // END prepare how many dots should be displayed depending on visible category width
        
        
        dotsNumber = Double(categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[visibleCategoryName]!)][0])!
        _dotsNumber = State(initialValue: dotsNumber)
        
        self.oneDotRangeLength = Double(1.0/dotsNumber)
        
        _dotsWidth = State(initialValue: Array(repeating: CGFloat(initialDotWidth), count: Int(dotsNumber)))
        _dotsOpacity = State(initialValue: Array(repeating: initialDotOpacity, count: Int(dotsNumber)))
        
        // prepare fractionCompleted ranges so that the correct dot changes its size and opacity
        var fractionCompletedDotsRanges:Dictionary<MyRange, String> = Dictionary<MyRange, String>()
        
        for index in 0..<Int(dotsNumber) {
            let rangeStart:Double = Double(index) * oneDotRangeLength
            let rangeEnd:Double = Double(index) * oneDotRangeLength + oneDotRangeLength
            
            fractionCompletedDotsRanges[MyRange(range: rangeStart..<rangeEnd)] = String(index)
        }
        
        _fractionCompletedDotsRanges = State(initialValue: fractionCompletedDotsRanges)
        // END prepare fractionCompleted ranges so that the correct dot changes its size and opacity
    }
    func makeBody(configuration: Configuration) -> some View {
        HStack {
                ForEach(0 ..< Int(dotsNumber), id: \.self) { index in
                    VStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: self.dotsWidth[index])
                            .opacity(self.dotsOpacity[index])
                        
                    }
                    .frame(width: 10, height: 10)
                }
                .onChange(of: self.visibleCategoryName, perform: { value in

                    if self.fractionCompleted < 0.0507 {
                        self.dotsWidth = Array(repeating: CGFloat(initialDotWidth), count: Int(Double(self.categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[value]!)][0])!))
                        self.dotsOpacity = Array(repeating: initialDotOpacity, count: Int(Double(self.categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[value]!)][0])!))
                    }

                    // set all dots to full state when fractionCompleted drops from 0 to 1
                    if self.fractionCompleted > 0.95 {
                        self.dotsWidth = Array(repeating: maxDotWidth, count: Int(Double(self.categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[value]!)][0])!))
                        self.dotsOpacity = Array(repeating: maxDotOpacity, count: Int(Double(self.categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[value]!)][0])!))
                    }
                    
                    self.dotsNumber = Double(self.categoryWidthRangesToDotsNumber[Double(iconsCategoriesProgressBarsSizes[value]!)][0])!
                })
        }
        .onChange(of: configuration.fractionCompleted, perform: { value in
            
            self.fractionCompleted = value!
            if value! > 0.0507 && value! < 0.95 {
            let fractionCompletedRangeDotIndex = Int(self.fractionCompletedDotsRanges[Double(value!)][0])!
            let dotFilledPercentage = (value! - Double(fractionCompletedRangeDotIndex) * self.oneDotRangeLength) / self.oneDotRangeLength

            self.dotsWidth[fractionCompletedRangeDotIndex] = CGFloat(Double(initialDotWidth) + 10 * dotFilledPercentage)
            self.dotsOpacity[fractionCompletedRangeDotIndex] = initialDotOpacity + 0.3 * dotFilledPercentage
            }
        })
    }
}


struct RulerProgressViewStyle: ProgressViewStyle {
    var progressStatusColor: Color
    
    let dashSize = [CGFloat(20), CGFloat(3)]
    
    func getSingleLineYAxisEnding(singleLingIndex: Int) -> Int {
        let singleLineIsDividedBy5: Bool = singleLingIndex % 5 == 0
        let singleLineIsDividedBy10: Bool = singleLingIndex % 10 == 0
        
        if singleLineIsDividedBy5 && singleLineIsDividedBy10 {
            return -6
        } else if singleLineIsDividedBy5 {
            return -4
        }
        
        return -2
    }
    
    func isPathBelowFractionCompleted(pathIndex: Int, fractionCompleted: Double) -> Bool {
        return Double(pathIndex) / Double(41) < fractionCompleted
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            GeometryReader { geometry in
                HStack(spacing:2) {
                    ForEach(0..<41) { number in
                        
                        if number == 0 || number == 40 {
                            Path{ path in
                                path.move(to: CGPoint(x: 0, y: 0))
                                path.addLine(to: CGPoint(x: 0, y: 0))
                            }
                            .frame(width: 2.5)
                            
                        } else {
                            Path{ path in
                                path.move(to: CGPoint(x: 0, y: 0))
                                path.addLine(to: CGPoint(x: 0, y: getSingleLineYAxisEnding(singleLingIndex: number)))
                            }
                            .stroke(style: StrokeStyle( lineWidth: number % 10 == 0 ? 3 : 2,lineCap: .round,  dash: [CGFloat(40), CGFloat(3)]))
                            .foregroundColor(isPathBelowFractionCompleted(pathIndex: number, fractionCompleted: configuration.fractionCompleted!) ? Color.white : Color.white.opacity(0.4))
                            .frame(width: 2.7)
                        }
                    }
                }
                .frame(width: 190, height: 10)
                .offset(x:0, y:4)
            }
        }
    }
}


struct RulerProgressBarPreView: View {
    @State var visibleCategoryPercentageFromBeginning: Double = 0.3
    
    var body: some View {
        ProgressView(value: visibleCategoryPercentageFromBeginning)
            .frame(height: 5)
            .accentColor(.white.opacity(0.8))
            .foregroundColor(.white.opacity(0.5))
            .progressViewStyle(
                RulerProgressViewStyle(
                    progressStatusColor: Color.orange
                )
            )
    }
}

struct RulerProgressBarPreView_Previews: PreviewProvider {
    static var previews: some View {
        RulerProgressBarPreView()
    }
}
