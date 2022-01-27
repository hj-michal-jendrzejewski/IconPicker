//
//  IconSmartCategoriesView.swift
//  PPL
//
//  Created by Michal Jendrzejewski on 12/09/2021.
//

import SwiftUI
import DYPopoverView

struct IconSmartCategoriesView: View {
    var iconTapAction: (_ iconName: String) -> Void
    var onAppearAction: () -> Void
    @Binding var iconsCategoriesSizes: [String: CGFloat]
    
    @AppStorage("pinnedIcons") var pinnedIcons: [String] = []
    @AppStorage("last24Icons") var last24Icons: [String] = []
    @EnvironmentObject var selectedThemeColors: SelectedThemeColors
    
    @State private var cleanHistoryButtonTipVisibility: Bool = false
    
    private let gridSpacing = 10
    let rows = [
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0)
    ]
    
    private let iconWidth = 24
    
    func addIconToPinned(iconName: String) -> Void {
        if !pinnedIcons.contains(iconName) {
            pinnedIcons.insert(iconName, at: 0)
        }
    }
    
    func removeIconFromPinned(iconName: String) -> Void {
        if let iconNameIndex = pinnedIcons.firstIndex(of: iconName) {
            pinnedIcons.remove(at: iconNameIndex)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("PINNED")
                .smartIconsSectionHeaderStyle()
//                                .offset(x: self.scrollOffset + 75)
            
            if (pinnedIcons.count == 0) {
                Spacer()
                Text("Long press any icon to keep it here. Do the same within this section to unpin it.")
                    .font(.footnote)
                    .frame(width: 70)
                //                                        .padding([.top], 60)
                Spacer()
                
            } else {
                LazyHGrid(rows: rows, spacing: CGFloat(gridSpacing)) {
                    ForEach(pinnedIcons, id: \.self) { iconName in
                        
                        IconView(
                            iconString: iconName,
                            showIconCategoryColor: true
                        )
                        .onTapGesture {
                            self.iconTapAction(iconName)
                        }
                        .onLongPressGesture {
                            self.removeIconFromPinned(iconName: iconName)
                        }
                        .frame(width: CGFloat(iconWidth))
                    }
                }
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                .frame(height: 220.00)
            }
        }
        .id("pinned")
        .frame(width:pinnedIcons.count > 18 ? CGFloat((ceil(Double(Float(pinnedIcons.count)/Float(6))))*34) : 90,height: 255.00)
        .padding(10)
        .background(selectedThemeColors.bgSecondaryColour)
        .cornerRadius(10)
        .onAppear {
            // the horizontal available space is size.width
            self.iconsCategoriesSizes["AAPinned"] = pinnedIcons.count > 18 ? CGFloat((ceil(Double(Float(pinnedIcons.count)/Float(6))))*34) : 90
            
            self.onAppearAction()
        }
        
        VStack(alignment: .leading) {
            HStack {
                Text("HISTORY")
                    .smartIconsSectionHeaderStyle()
//                                    .offset(x: self.visibleCategoryName == "History" ? (CGFloat(Int(self.scrollOffset)) - 120) : 0)
                Spacer()
                Button(action: {
                    self.last24Icons = []
                }) {
                    Text("Clear history")
                        .multilineTextAlignment(.trailing)
                        .lineSpacing(-15)
                        .font(.system(size: 10))
                        .frame(width: 50, height: 25)
                        .foregroundColor(.red)
                }
                .disabled(self.last24Icons.count == 0)
                .onHover { hover in
                    self.cleanHistoryButtonTipVisibility = hover
                }
                .popoverView(content: {Text("Start new life:)").foregroundColor(.orange)}, background: {Color.white.opacity(0.8)}, isPresented: self.$cleanHistoryButtonTipVisibility, frame: .constant(CGRect(x: 200, y: 0, width: 120, height: 30)), anchorFrame: nil, popoverType: .popout, position: .bottomLeft, viewId: "thirdPopover", settings: DYPopoverViewSettings(arrowLength: 10, offset: CGSize(width: 5, height: 25)))
            }
            .zIndex(100)
            
            if (last24Icons.count == 0) {
                Spacer()
                Text("Make history!")
                    .font(.footnote)
                    .frame(width: 70)
                Spacer()
                
            } else {
                LazyHGrid(rows: rows, spacing: CGFloat(gridSpacing)) {
                    ForEach(last24Icons, id: \.self) { iconName in
                        
                        IconView(
                            iconString: iconName,
                            showIconCategoryColor: true
                        )
                        .onTapGesture {
                            self.iconTapAction(iconName)
                        }
                        .onLongPressGesture {
                            self.addIconToPinned(iconName: iconName)
                        }
                        .frame(width: CGFloat(iconWidth))
                        //
                    }
                }
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                .frame(height: 220.00)
                
            }
        }
        .id("History")
        .frame(width: last24Icons.count > 12 ? CGFloat((ceil(Double(Float(last24Icons.count)/Float(6))))*34) : 90,height: 255.00)
        .padding(10)
        .background(selectedThemeColors.bgSecondaryColour)
        .cornerRadius(10)
        .fixedSize()
        .onAppear {
            // the horizontal available space is size.width
            self.iconsCategoriesSizes["AHistory"] = CGFloat((ceil(Double(Float(last24Icons.count)/Float(6))))*34)
            
            self.onAppearAction()
        }
        
        VStack(alignment: .leading) {
            Text("SUGGESTIONS")
                .smartIconsSectionHeaderStyle()
                Spacer()
                Text("Soon will be full :)")
                    .font(.footnote)
                    .frame(width: 70)
                Spacer()
        }
        .id("Suggestions")
        .frame(width: 120, height: 255.00)
        .padding(10)
        .background(selectedThemeColors.bgSecondaryColour)
        .cornerRadius(10)
        .fixedSize()
        .onAppear {
            // the horizontal available space is size.width
            self.iconsCategoriesSizes["ASuggestions"] = 120
            
            self.onAppearAction()
        }
    }
}

struct IconSmartCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        func printString(string: String) -> Void {
            print(string)
        }
        
        func printDupa() -> Void {
            print("DUPA")
        }
        
        return IconSmartCategoriesView(
            iconTapAction: printString,
            onAppearAction: printDupa,
            iconsCategoriesSizes: .constant(["dupa" : 34])
        )
        .environmentObject(SelectedThemeColors())
    }
}
