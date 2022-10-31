//
//  IconCategoriesMenuIconsSetPart.swift
//  
//
//  Created by Michal Jendrzejewski on 30/09/2021.
//

import SwiftUI
import DYPopoverView

struct IconCategoriesMenuIconsSetPart: View {
    @Binding var scrolledToCategoryName: String
    var allCategoriesArray: [String]
    var iconsInCategories: [String: [String]]
    var PHSAndAllCategoriesArray: [String]
    @Binding var PHSAndAllCategoriesToolTipsVisibilityArray: Array<Bool>
    var visibleCategoryName:String
    
    
    
    private let fakeBgHeight: CGFloat = 41
    
    func getMenuItemBgView() -> AnyView {
        return AnyView(Rectangle()
            .fill(ThemeColors().bgMainColour)
            .frame(width: 43, height: fakeBgHeight))
    }
    
    var body: some View {
        Group {
                    ForEach (Array(allCategoriesArray.enumerated()), id: \.offset) {index, category in
                            Button(action: {
                                scrolledToCategoryName = category
                            }) {

                                //todo: move below repeated modifiers to external one
                                ZStack {
                                    if ((Unicode.Scalar(iconsInCategories[category]![0])?.properties.isEmoji) != nil) {
                                        Text(iconsInCategories[category]![0])
                                            .padding(10)
                                            .foregroundColor(categoriesRainbowColors[category])
                                            .scaleEffect((visibleCategoryName == category || PHSAndAllCategoriesToolTipsVisibilityArray[index + 3] == true) ? 1.5 : 1)
                                            .animation(.easeInOut)

                                            .background(getMenuItemBgView())
                                    } else {
                                        Image(systemName: iconsInCategories[category]![0])
                                            .padding(10)
                                            .foregroundColor(categoriesRainbowColors[category])
                                            .scaleEffect((visibleCategoryName == category || PHSAndAllCategoriesToolTipsVisibilityArray[index + 3] == true) ? 1.5 : 1)
                                            .animation(.easeInOut)
                                            .background(getMenuItemBgView())
        //                                    .overlay(
        //                                        ProgressView(value: visibleCategoryName == category ? self.visibleCategoryPercentageFromBeginning : 0.0)
        //                                                .progressViewStyle(CustomCircularProgressViewStyle())
        //                                            .accentColor(categoriesRainbowColors[category])
        //                                                .zIndex(15)
        //                                        .padding(0)
        //                                            .scaleEffect(0.9)
        //                                    )
                                    }
        //
                                }
                            }
                            .onHover { hover in
                                PHSAndAllCategoriesToolTipsVisibilityArray[index + 3] = hover
                            }
//                            .popoverView(content: {Text(category.uppercased()).foregroundColor(Color.white)}, background: {categoriesRainbowColors[category].opacity(0.8)}, isPresented: self.$PHSAndAllCategoriesToolTipsVisibilityArray[index + 3], frame: .constant(CGRect(x: 0, y: 0, width: category.count * 4 + 100, height: 30)),  anchorFrame: nil, popoverType: .popout, position: .top, viewId: String(index + 3) + "Popover", settings: DYPopoverViewSettings(arrowLength: 10, offset: CGSize(width: 15, height: 0)))
                    }
    }
    }
        
}

struct IconCategoriesMenuIconsSetPart_Previews: PreviewProvider {
    static var previews: some View {
        IconCategoriesMenuIconsSetPart(
            scrolledToCategoryName: .constant("lalla"),
            allCategoriesArray: ["cat1", "cat2"],
            iconsInCategories: ["LLL": ["cat1", "cat2"]],
            PHSAndAllCategoriesArray: ["cat1", "cat2"],
            PHSAndAllCategoriesToolTipsVisibilityArray: .constant([false]),
            visibleCategoryName: "cat1"
            
        )
    }
}
