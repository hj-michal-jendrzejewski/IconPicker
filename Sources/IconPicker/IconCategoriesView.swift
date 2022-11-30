//
//  IconCategoriesView.swift
//  PPL
//
//  Created by Michal Jendrzejewski on 09/07/2021.
//

import SwiftUI
import DYPopoverView

struct IconCategoriesView: View {
    var iconsInCategories: [String: [String]]
    @Binding var scrolledToCategoryName: String
    @Binding var visibleCategoryName: String
    @Binding var visibleCategoryPercentageFromBeginning: Double
    var iconTapAction: (_ iconName: String) -> Void
    
    @State private var scrollOffset: ViewOffsetKey.Value = -87
    
    @State private var iconsCategoriesOffsetsReverese = Dictionary<MyRange, String>()
    @State private var iconsCategoriesOffsets: [String: [Int]] = [:]
    @State private var iconsCategoriesSizes: [String: CGFloat] = [:]
    @State private var iconsCategoriesProgressBarsSizes: [String: CGFloat] = [:]
    @State private var iconsCategoriesVibrationOffsets: [Int] = []
    @State private var initialScrollOffset: ViewOffsetKey.Value = -1000
    @State private var headerViewSizeAndGlobalCoordinates: CGRect? = nil
    
    
    
    
    @AppStorage("pinnedIcons") var pinnedIcons: [String] = []
    @AppStorage("last24Icons") var last24Icons: [String] = []
    
    private let gridSpacing = 10
    private let iconWidth = 24
    private let smartCategoriesNumber = 3
    
    let rows = [
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0)
    ]
    
    func addIconToPinned(iconName: String) -> Void {
        if !pinnedIcons.contains(iconName) {
            pinnedIcons.insert(iconName, at: 0)
        }
    }
    
    
    
    func addIconToLast24(iconName: String) -> Void {
        
        if let iconNameIndex = last24Icons.firstIndex(of: iconName) {
            last24Icons.remove(at: iconNameIndex)
        }
        
        if last24Icons.count < 24 {
            withAnimation {
                last24Icons.insert(iconName, at: 0)
            }
        } else {
            last24Icons.remove(at: 23)
            last24Icons.insert(iconName, at: 0)
        }
    }
    
    func setCategoriesSizesAndOffsets() -> Void {
        if self.iconsCategoriesSizes.count == iconsInCategories.count + self.smartCategoriesNumber && self.iconsCategoriesOffsetsReverese.count == 0 {
            
            var rangeStart = -320
            
            for categoryName in Array(iconsCategoriesSizes.keys).sorted() {
                let rangeMax = rangeStart + Int(self.iconsCategoriesSizes[categoryName]!) + 27
                let oneFourthOfCategoryWidth = Int(iconsCategoriesSizes[categoryName]! / 4)
                let halfOfCategoryWidth = Int(iconsCategoriesSizes[categoryName]! / 2)
                
                self.iconsCategoriesOffsetsReverese[MyRange(range: Double(rangeStart)..<Double(rangeMax))] = categoryName
                self.iconsCategoriesOffsets[categoryName] = [rangeStart, rangeMax]
                self.iconsCategoriesVibrationOffsets.append(contentsOf: [rangeStart, rangeStart + oneFourthOfCategoryWidth, rangeStart + halfOfCategoryWidth, rangeMax - oneFourthOfCategoryWidth])
                rangeStart = rangeMax
            }
        }
        print(self.iconsCategoriesSizes)
        print(self.iconsCategoriesOffsets)
    }

    func setVisibleCategoryNameAsTitle(offsetKey: ViewOffsetKey.Value) -> Void {
        if self.iconsCategoriesOffsetsReverese[Double(offsetKey)].count > 0 {
            print(self.iconsCategoriesOffsetsReverese[Double(Int(offsetKey))][0])
            print(Double(Int(offsetKey)))
            let visibleCategoryName = self.iconsCategoriesOffsetsReverese[Double(Int(offsetKey))][0].replacingOccurrences(of: "AAPinned", with: "Pinned").replacingOccurrences(of: "AHistory", with: "History").replacingOccurrences(of: "ASuggestions", with: "Suggestions")
            self.visibleCategoryName = visibleCategoryName
        }
    }
    
    func getShortcutNumber(number: Int) -> String {
        return String(number + 3)
    }
    
    func setVisibleCategoryPercentageFromBeginning() -> Void {
        if self.iconsCategoriesOffsets[visibleCategoryName] != nil {
            let visibleCategoryLength: Double = Double(iconsCategoriesOffsets[visibleCategoryName]![1] - iconsCategoriesOffsets[visibleCategoryName]![0])
            let visibleCategoryShownPartLength: Double = Double(Int(self.scrollOffset) -  iconsCategoriesOffsets[visibleCategoryName]![0])

            self.visibleCategoryPercentageFromBeginning = Double(visibleCategoryShownPartLength / visibleCategoryLength)
        }
    }
    
    func setNewScrollToId(scrollToId: String) -> Void {
        self.scrolledToCategoryName = scrollToId
    }
    
    func getId(categoryName: String, columnNumber: Int) -> String {
        return categoryName + String(columnNumber / 6)
    }
    
    func generateVibration() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
    }
    
    var body: some View {
        ZStack {
//            HStack {
//                Text(visibleCategoryName)
//                Text(String(Int(self.scrollOffset)))
////                Text(String(Int()))
////                Text(String(iconsCategoriesSizes[visibleCategoryName]))
//            }
//            .zIndex(5)
                
            ScrollView(. horizontal)
            {
                ScrollViewReader { scrollView in
                    
                    HStack {
                        Group {
                            IconSmartCategoriesView(
                                iconTapAction: iconTapAction,
                                onAppearAction: setCategoriesSizesAndOffsets,
                                iconsCategoriesSizes: $iconsCategoriesSizes
                            )
                            
                            Divider()
                            
                            ForEach (Array(iconsInCategories.keys).sorted(), id: \.self) {category in
                                
                                IconCategoryView(
                                    category: category,
                                    iconsInCategories: iconsInCategories,
                                    iconTapAction: iconTapAction)
                                
                                .onAppear {
                                    self.iconsCategoriesSizes[category] = CGFloat((ceil(Double(Float(iconsInCategories[category]!.count)/Float(6))))*34)
                                    
                                    self.iconsCategoriesProgressBarsSizes[category] = CGFloat(iconsCategoriesSizes[category]! / 6)
                                    self.setCategoriesSizesAndOffsets()
                                }
                            }
                        }
                    }
                    .onChange(of: scrolledToCategoryName, perform: { value in
                        withAnimation{
                            scrollView.scrollTo(scrolledToCategoryName, anchor: .bottomLeading)
                        }
                    })
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self,
                                               value: -$0.frame(in: .named("scroll")).origin.x)
                    })
                    // this section is run on every scroll action so add code consiously here otherwise it may overload the app!!!
                    .onPreferenceChange(ViewOffsetKey.self) {
                        self.scrollOffset = $0
                        if self.initialScrollOffset == -1000 {
                            self.initialScrollOffset =  $0
                        }
                        print($0, Int($0))
                        if self.iconsCategoriesVibrationOffsets.contains(Int($0)) {
                            print ($0, "vibrateeeeeee!!!")
                        }
                        setVisibleCategoryNameAsTitle(offsetKey: $0)
                        setVisibleCategoryPercentageFromBeginning()
                    }
                }
            }
            
            VStack(alignment: .leading) {
                HStack {
                    IconView(iconString: iconsInCategories[visibleCategoryName] != nil ? iconsInCategories[visibleCategoryName]![0] : "")
                        .padding(0)
                        .background(Color.white.opacity(0.6))
                        .foregroundColor(categoriesRainbowColors[visibleCategoryName])
                        .cornerRadius(3)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(visibleCategoryName.uppercased())
                            .animation(.default)
                            .frame(width: 200, height: 10, alignment: .leading)
                        if iconsCategoriesProgressBarsSizes.count > 5 && ["Pinned", "History", "Suggestions"].firstIndex(of: visibleCategoryName) == nil {
                            ProgressView(value: visibleCategoryPercentageFromBeginning)
                                .frame(height: 5)
                                .accentColor(.white.opacity(0.8))
                                .foregroundColor(.white.opacity(0.5))
                                .progressViewStyle(
                                    RulerProgressViewStyle(progressStatusColor: categoriesRainbowColors[visibleCategoryName]!)
                                )
                                .offset(y: 5)
                        }
                    }
                    Spacer()
                }
                .iconsSectionHeaderStyle()
                .frame(width: 270)
                .background(categoriesRainbowColors[visibleCategoryName] != nil ? categoriesRainbowColors[visibleCategoryName] : SelectedThemeColors2().fontMainColour.opacity(1))
                .cornerRadius(5)
                .zIndex(10)
                .opacity(["Pinned", "History", "Suggestions"].firstIndex(of: visibleCategoryName) == nil ? 1.0 : 0.0)
                .animation(.default)
                .onChange(of: self.visibleCategoryPercentageFromBeginning, perform: { value in
                    
//                    print(value)
                    if value < 0.05 {
                        print("początek", self.scrollOffset)
                    } else if (value > 0.24 && value < 0.26) {
                        print ("ćwiara", self.scrollOffset)
                        generateVibration()
                    } else if (value > 0.49 && value < 0.51) {
                        print ("środek", self.scrollOffset)
                        generateVibration()
                    } else if (value > 0.74 && value < 0.76) {
                        print("trzy czwarte", self.scrollOffset)
                        generateVibration()
                    }
                })
            }
            .frame(width: 405, alignment: .leading)
            .offset(x: -10, y:-115)
            
//        }
        }
        .foregroundColor(SelectedThemeColors2().listHeaderColour)

    }
}

struct IconCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        func printString(string: String) -> Void {
            print(string)
        }
        return IconCategoriesView(
            iconsInCategories: Emojis().emojis,
            scrolledToCategoryName: .constant("Pinned"),
            visibleCategoryName: .constant("Pinned"),
            visibleCategoryPercentageFromBeginning: .constant(0.5),
            iconTapAction: printString
        )
        .environmentObject(SelectedThemeColors())
    }
}
