////
////  IconsPinned.swift
////  PPL
////
////  Created by Michal Jendrzejewski on 03/09/2021.
////
//
//import SwiftUI
//
//struct IconsPinned: View {
//    var iconTapAction: (_ iconName: String) -> Void
//    @Binding var iconsCategoriesSizes: [String: CGFloat]
//
//    @AppStorage("pinnedIcons") var pinnedIcons: [String] = []
//    
//
//    private let gridSpacing = 10
//    private let iconWidth = 24
//    private let smartCategoriesNumber = 3
//    f
//    let rows = [
//        GridItem(.fixed(40.00), spacing: 0),
//        GridItem(.fixed(40.00), spacing: 0),
//        GridItem(.fixed(40.00), spacing: 0),
//        GridItem(.fixed(40.00), spacing: 0),
//        GridItem(.fixed(40.00), spacing: 0),
//        GridItem(.fixed(40.00), spacing: 0)
//    ]
//
//    func addIconToPinned(iconName: String) -> Void {
//        if !pinnedIcons.contains(iconName) {
//            pinnedIcons.insert(iconName, at: 0)
//        }
//    }
//
//    func removeIconFromPinned(iconName: String) -> Void {
//        if let iconNameIndex = pinnedIcons.firstIndex(of: iconName) {
//            pinnedIcons.remove(at: iconNameIndex)
//        }
//    }
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("PINNED")
//                .smartIconsSectionHeaderStyle()
////                                .offset(x: self.scrollOffset + 75)
//
//            if (pinnedIcons.count == 0) {
//                Spacer()
//                Text("Long press any icon to keep it here. Do the same within this section to unpin it.")
//                    .font(.footnote)
//                    .frame(width: 70)
//                //                                        .padding([.top], 60)
//                Spacer()
//
//            } else {
//                LazyHGrid(rows: rows, spacing: CGFloat(gridSpacing)) {
//                    ForEach(pinnedIcons, id: \.self) { iconName in
//
//                        IconView(
//                            iconString: iconName,
//                            showIconCategoryColor: true
//                        )
//                        .onTapGesture {
//                            self.iconTapAction(iconName)
//                        }
//                        .onLongPressGesture {
//                            self.removeIconFromPinned(iconName: iconName)
//                        }
//                        .frame(width: CGFloat(iconWidth))
//                    }
//                }
//                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
//                .frame(height: 220.00)
//            }
//        }
//        .id("pinned")
//        .frame(width:pinnedIcons.count > 18 ? CGFloat((ceil(Double(Float(pinnedIcons.count)/Float(6))))*34) : 90,height: 255.00)
//        .padding(10)
//        .background(SelectedThemeColors2().bgSecondaryColour)
//        .cornerRadius(10)
//        .onAppear {
//            // the horizontal available space is size.width
//            self.iconsCategoriesSizes["AAPinned"] = pinnedIcons.count > 18 ? CGFloat((ceil(Double(Float(pinnedIcons.count)/Float(6))))*34) : 90
//        }
//    }
//}
//
//struct IconsPinned_Previews: PreviewProvider {
//    static var previews: some View {
//        func printString(string: String) -> Void {
//            print(string)
//        }
//
//        return IconsPinned(
//            iconTapAction: printString,
//            iconsCategoriesSizes: .constant(["Pinned": CGFloat()])
//        )
//    }
//}
