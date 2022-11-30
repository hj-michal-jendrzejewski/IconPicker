//
//  IconCategoriesMenuView.swift
//  PPL
//
//  Created by Michal Jendrzejewski on 08/07/2021.
//

import SwiftUI
import DYPopoverView

    

struct IconCategoriesMenuView: View {
    var iconsInCategories: [String: [String]]
    @Binding var scrolledToCategoryName: String
    @Binding var visibleCategoryPercentageFromBeginning: Double
    var visibleCategoryName:String
    
    
    
    @State private var allCategoriesArray: [String] = []
    @State var PHSAndAllCategoriesArray: [String] = []
    @State var PHSAndAllCategoriesToolTipsVisibilityArray: Array<Bool> = Array(repeating: false, count: 11)
    private let fakeBgHeight: CGFloat = 41
    
    func getNextCategoryName() -> String {
        let visibleCategoryIndex = PHSAndAllCategoriesArray.firstIndex(of: self.visibleCategoryName)
        let PHSAndAllCategoriesNumber = PHSAndAllCategoriesArray.count
        
        if visibleCategoryIndex! == PHSAndAllCategoriesNumber - 1 {
            return PHSAndAllCategoriesArray[0]
        } else {
            return PHSAndAllCategoriesArray[visibleCategoryIndex! + 1]
        }
    }
    
    func getPreviousCategoryName() -> String {
        let visibleCategoryIndex = PHSAndAllCategoriesArray.firstIndex(of: self.visibleCategoryName)
        let PHSAndAllCategoriesNumber = PHSAndAllCategoriesArray.count
        
        if visibleCategoryIndex! == 0 {
            return PHSAndAllCategoriesArray[PHSAndAllCategoriesNumber - 1]
        } else {
            return PHSAndAllCategoriesArray[visibleCategoryIndex! - 1]
        }
    }
    
    func getMenuItemBgView() -> AnyView {
        return AnyView(Rectangle()
            .fill(SelectedThemeColors2().bgMainColour)
            .frame(width: 43, height: fakeBgHeight))
    }
    
        
       
    var body: some View {
        HStack(spacing:-1) {
            Button(action: {
                scrolledToCategoryName = "pinned"
            }) {
                Image(systemName: "pin")
                    .padding([.top, .trailing, .bottom],9)
                    .padding([.leading], 0)
                    .foregroundColor(visibleCategoryName == "Pinned" ? SelectedThemeColors2().fontMainColour.opacity(0.9) : SelectedThemeColors2().fontMainColour.opacity(0.6))
                    .scaleEffect((visibleCategoryName == "Pinned" || self.PHSAndAllCategoriesToolTipsVisibilityArray[0] == true) ? 1.5 : 1)
                    .background(getMenuItemBgView())
                    .overlay(SelectedThemeColors2().fontMainColour
                                .opacity(visibleCategoryName == "Pinned" ? 0.9 : 0.0)
                                                            .cornerRadius(10)
                                                            .frame(height: 2).offset(x:0, y: 15))
                    .animation(.easeInOut)
            }
            .onHover { hover in
                self.PHSAndAllCategoriesToolTipsVisibilityArray[0] = hover
            }
            .popoverView(content: {Text("PINNED").foregroundColor(.white)}, background: {SelectedThemeColors2().fontMainColour.opacity(0.6)}, isPresented: self.$PHSAndAllCategoriesToolTipsVisibilityArray[0], frame: .constant(CGRect(x: 200, y: 0, width: 80, height: 30)), anchorFrame: nil, popoverType: .popout, position: .topRight, viewId: "thirdPopover", settings: DYPopoverViewSettings(arrowLength: 10, offset: CGSize(width: 15, height: -10)))

            Button(action: {
                scrolledToCategoryName = "History"
            }) {
                Image(systemName: "clock")
                    .padding(9)
                    .foregroundColor(visibleCategoryName == "History" ? SelectedThemeColors2().fontMainColour.opacity(0.9) : SelectedThemeColors2().fontMainColour.opacity(0.6))

                    .scaleEffect((visibleCategoryName == "History" || self.PHSAndAllCategoriesToolTipsVisibilityArray[1] == true) ? 1.5 : 1)
                    .background(getMenuItemBgView())
                    .overlay(SelectedThemeColors2().fontMainColour
                                .opacity(visibleCategoryName == "History" ? 0.9 : 0.0)
                                                            .cornerRadius(10)
                                                            .frame(height: 2).offset(x:0, y: 15))
                    .animation(.easeInOut)
            }
            .onHover { hover in
                self.PHSAndAllCategoriesToolTipsVisibilityArray[1] = hover
            }
            .popoverView(content: {Text("HISTORY").foregroundColor(.white)}, background: {SelectedThemeColors2().fontMainColour.opacity(0.6)}, isPresented: self.$PHSAndAllCategoriesToolTipsVisibilityArray[1], frame: .constant(CGRect(x: 200, y: 0, width: 80, height: 30)), anchorFrame: nil, popoverType: .popout, position: .top, viewId: "thirdPopover", settings: DYPopoverViewSettings(arrowLength: 10, offset: CGSize(width: 10, height: 0)))
            //
            Button(action: {
                scrolledToCategoryName = "Suggestions"
            }) {
                Image(systemName: "lasso.sparkles")
                    .padding(9)
                    .foregroundColor(visibleCategoryName == "Suggestions" ? SelectedThemeColors2().fontMainColour.opacity(0.9) : SelectedThemeColors2().fontMainColour.opacity(0.6))
                    .scaleEffect((visibleCategoryName == "Suggestions" || PHSAndAllCategoriesToolTipsVisibilityArray[2] == true) ? 1.5 : 1)
                    .background(getMenuItemBgView())
                    .overlay(SelectedThemeColors2().fontMainColour
                                .opacity(visibleCategoryName == "Suggestions" ? 0.9 : 0.0)
                                                            .cornerRadius(10)
                                                            .frame(height: 2).offset(x:0, y: 15))
                    .animation(.easeInOut)

            }
            .onHover { hover in
                self.PHSAndAllCategoriesToolTipsVisibilityArray[2] = hover
            }
            .popoverView(content: {Text("SUGGESTIONS").foregroundColor(.white)}, background: {SelectedThemeColors2().fontMainColour.opacity(0.6)}, isPresented: self.$PHSAndAllCategoriesToolTipsVisibilityArray[2], frame: .constant(CGRect(x: 0, y: 0, width: 140, height: 30)), anchorFrame: nil, popoverType: .popout, position: .top, viewId: "thirdPopover", settings: DYPopoverViewSettings(arrowLength: 10, offset: CGSize(width: 10, height: 0)))
            
            Divider()
//                .background(Color.black.opacity(0.1))
                .zIndex(100)
                .opacity(0.3)
            
            IconCategoriesMenuIconsSetPart(
                scrolledToCategoryName: $scrolledToCategoryName,
                allCategoriesArray: allCategoriesArray,
                iconsInCategories: iconsInCategories,
                PHSAndAllCategoriesArray: PHSAndAllCategoriesArray,
                PHSAndAllCategoriesToolTipsVisibilityArray: $PHSAndAllCategoriesToolTipsVisibilityArray,
                visibleCategoryName: visibleCategoryName
            )
            
            VStack {
                Button(action: {
                    scrolledToCategoryName = "pinned"
                }) {
                    Text("Pinned")
                }
                .keyboardShortcut(KeyboardShortcut(KeyEquivalent("p"), modifiers: [.command, .shift]))
                
                Button(action: {
                    scrolledToCategoryName = "History"
                }) {
                    Text("History")
                }
                .keyboardShortcut(KeyboardShortcut(KeyEquivalent("h"), modifiers: [.command, .shift]))
                
                Button(action: {
                    scrolledToCategoryName = "Suggestions"
                }) {
                    Text("Suggestions")
                }
                .keyboardShortcut(KeyboardShortcut(KeyEquivalent("s"), modifiers: [.command, .shift]))
                
                ForEach (Array(allCategoriesArray.enumerated()), id: \.offset) {index, category in
                    Button(action: {
                        scrolledToCategoryName = category
                    }) {
                        Text(category)
                    }
                    .hoverEffect(.lift)
                    .keyboardShortcut(KeyboardShortcut(KeyEquivalent(Character(String(index + 1))), modifiers: [.command]))
                    
                    
                    Button(action: {
                        scrolledToCategoryName = getNextCategoryName()
                    }) {
                        Text("Next category ->")
                    }
                    .keyboardShortcut(KeyboardShortcut(KeyEquivalent.tab, modifiers: [.command, .shift, .option]))
                    
                    
                    
                    Button(action: {
                        scrolledToCategoryName = getPreviousCategoryName()
                    }) {
                        Text("Previous category <-")
                    }
                    .keyboardShortcut(KeyboardShortcut(KeyEquivalent.tab, modifiers: [.command, .shift, .option, .control]))
                    
                }
            }
            .font(.system(size: 0.1))

            Text("Bg filler ")
                .foregroundColor(SelectedThemeColors2().bgMainColour)
                .background(Rectangle()
                                .fill(SelectedThemeColors2().bgMainColour)
                                .frame(width: 30, height: fakeBgHeight * 2.5)
                                .offset(y: -20),
                            alignment: .topLeading)
                .font(.system(size: 0.1))
            
                
        }
        .background(Rectangle()
                        .fill(SelectedThemeColors2().bgMainColour)
                        .frame(width: 27, height: fakeBgHeight * 2.5).offset(x: -33),
                    alignment: .topLeading)
        .frame(width:420)
        .animation(.easeInOut)
        .onAppear{
            allCategoriesArray = Array(iconsInCategories.keys).sorted()
            PHSAndAllCategoriesArray = ["Pinned", "History", "Suggestions"] + allCategoriesArray
        }
        .onChange(of: iconsInCategories) { newIconsInCategories in
        }
    }
}


struct IconCategoriesMenuView_Previews: PreviewProvider {
    static var previews: some View {
        IconCategoriesMenuView(
            iconsInCategories: Emojis().emojis,
            scrolledToCategoryName: .constant("OBJECTS"), visibleCategoryPercentageFromBeginning: .constant(0.9),
            visibleCategoryName: "Objects"
        )
        .environmentObject(SelectedThemeColors())
    }
}
