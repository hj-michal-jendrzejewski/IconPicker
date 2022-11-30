//
//  IconCategoryView.swift
//  PPL
//
//  Created by Michal Jendrzejewski on 06/10/2021.
//

import SwiftUI


struct IconCategoryView: View {
    var category: String
    var iconsInCategories: [String: [String]]
    var iconTapAction: (_ iconName: String) -> Void
    
    @AppStorage("last24Icons") var last24Icons: [String] = []
    @AppStorage("pinnedIcons") var pinnedIcons: [String] = []

    let rows = [
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0)
    ]

    private let gridSpacing = 10
    private let iconWidth = 24
    
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
    
    func getColumnId(categoryName: String, columnNumber: Int) -> String {
        return categoryName + String(columnNumber / 6)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                
            }
            .frame(height: 30)
            //                                .position(x:0, y:0)
            
            LazyHGrid(rows: rows, spacing: CGFloat(gridSpacing)) {
                ForEach(Array(iconsInCategories[category]!.enumerated()), id: \.element) { index, iconName in
                    
                    
                    if index % 6 == 0 {
                        IconView(iconString: iconName)
                            .onTapGesture {
                                self.iconTapAction(iconName)
                                self.addIconToLast24(iconName: iconName)
                            }
                            .onLongPressGesture(minimumDuration: 2) {
                                self.addIconToPinned(iconName: iconName)
                            }
                            .foregroundColor(Color.white)
                            .frame(width: CGFloat(iconWidth))
                            .id(getColumnId(categoryName: category, columnNumber: index))
                    } else {
                        IconView(iconString: iconName)
                            .onTapGesture {
                                self.iconTapAction(iconName)
                                self.addIconToLast24(iconName: iconName)
                            }
                            .foregroundColor(categoriesRainbowColors[category])
                            .frame(width: CGFloat(iconWidth))
                    }
                        
                }
            }
            .frame(height: 220.00)
        }
        .frame(width: CGFloat((ceil(Double(Float(iconsInCategories[category]!.count)/Float(6))))*34))
        .id(category)
        .padding(10)
        .background(categoriesRainbowColors[category].opacity(0.6))
        .cornerRadius(10)
        .fixedSize()
    }
}

struct IconCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        func printString(string: String) -> Void {
            print(string)
        }
        return IconCategoryView(
            category: "lalal",
            iconsInCategories: Emojis().emojis,
            iconTapAction: printString
        )
    }
}
