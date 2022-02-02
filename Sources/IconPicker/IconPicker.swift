//
//  SwiftUIIconPicker.swift
//  PPL
//
//  Created by Michal Jendrzejewski on 28/05/2021.
//

import SwiftUI
import DYPopoverView

public struct IconPickerView: View {
    var iconTapAction: (_ iconName: String) -> Void
    var searchFieldTitle: String?
    var headerView: AnyView?
    var triggerSizeAndCoordinates: CGRect?
    var connectorColor: Color?
    
    @ObservedObject var emojis = Emojis()
//    @EnvironmentObject var emojis: Emojis
    
    @State private var searchIconName:String = ""
    @State private var scrolledToCategoryName:String = ""
    @State private var visibleCategoryName: String = "Pinned"
    @State private var visibleCategoryPercentageFromBeginning: Double = 0.0
    @State private var cleanHistoryButtonTipVisibility: Bool = false
    @State private var settingsTipVisible: Bool = false
    @State private var showSfSymbols: Bool = true
    @State private var arrowPathOpacity = 0.0
    
    
    @AppStorage("last24Icons") var last24Icons: [String] = []
    
    @State private var headerViewSizeAndGlobalCoordinates: CGRect? = CGRect(x: 0.0, y: 0.0, width: 260.0, height: 30.0)

    private let headerLocalY: CGFloat = 19
    
    public init(iconTapAction: @escaping (_ iconName: String) -> Void, searchFieldTitle: String?, headerView: AnyView?, triggerSizeAndCoordinates: CGRect?, connectorColor: Color?) {
        self.iconTapAction = iconTapAction
        self.searchFieldTitle = searchFieldTitle ?? nil
        self.headerView = headerView ?? nil
        self.triggerSizeAndCoordinates = triggerSizeAndCoordinates ?? nil
        self.connectorColor = connectorColor ?? nil
    }
    
    
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            
            // triggering view to headerView connector
//            if self.headerViewSizeAndGlobalCoordinates != nil {
//                Path { path in
//                    path.move(to: CGPoint(x: 4, y: headerLocalY + 8))
//                    path.addQuadCurve(to: CGPoint(x: -6, y: headerLocalY + 13), control: CGPoint(x:-6, y: headerLocalY+6))
////                    path.addLine(to:CGPoint(x: -5, y: headerLocalY + 3))
//                    path.addLine(to: CGPoint(x: -6, y: -3 + headerLocalY + self.triggerSizeAndCoordinates!.midY - self.headerViewSizeAndGlobalCoordinates!.midY))
//                    path.addQuadCurve(to: CGPoint(x: -18, y: 5 + headerLocalY + self.triggerSizeAndCoordinates!.midY - self.headerViewSizeAndGlobalCoordinates!.midY), control: CGPoint(x:-5, y: 5 + headerLocalY + self.triggerSizeAndCoordinates!.midY - self.headerViewSizeAndGlobalCoordinates!.midY))
////                    path.addLine(to: CGPoint(x: -25, y: 5 + headerLocalY + self.triggerSizeAndCoordinates!.midY - self.headerViewSizeAndGlobalCoordinates!.midY))
//                }
//                .stroke(connectorColor!, lineWidth: 3)
//                .zIndex(5)
//                .offset(x: -7)
//                .opacity(arrowPathOpacity)
//
//                Image(systemName: "arrowtriangle.left.fill")
//                    .offset(x: -33, y: headerLocalY + self.triggerSizeAndCoordinates!.midY - self.headerViewSizeAndGlobalCoordinates!.midY)
//                    .foregroundColor(connectorColor)
//                    .font(.system(size: 13, weight: .thin))
//            }
            
            VStack(alignment: .leading, spacing: 0) {
                HStack (alignment: .center) {
                    GeometryReader { geo in
                        
                        if headerView != nil {
                            headerView
                                .onAppear {
                                    //this happens when you open icon picker while another instance is still visible
                                    //and the arrow normally pointing to the triggering tag icon gets wrong position
                                    if geo.frame(in: .global).midX < 0 {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.33) {
                                            self.arrowPathOpacity = 1.0
                                            self.headerViewSizeAndGlobalCoordinates = geo.frame(in: .global)
                                        }
                                    } else {
                                        self.arrowPathOpacity = 1.0
                                        self.headerViewSizeAndGlobalCoordinates = geo.frame(in: .global)
                                    }
                                }
                                .offset(y: -5)
                        }
                    }
                    .foregroundColor(SelectedThemeColors2().fontSecondaryColour)
//                    .frame(height: 25)
                    Spacer()
                    
                    Toggle(isOn: $showSfSymbols) {
                            Text("Show EMOJIS")
                                .foregroundColor(SelectedThemeColors2().fontMainColour)
                                .font(.caption)
                                .multilineTextAlignment(.trailing)
                    }
                    .frame(width: 110)
                    .onChange(of: self.showSfSymbols, perform: { value in
                        self.visibleCategoryName = "Pinned"
                    })
                    
                    Button(action: {}) {
                        Image(systemName: "gearshape.fill")
                            .font(.title)
                            .foregroundColor(SelectedThemeColors2().fontSecondaryColour)
//                            .background(getMenuItemBgView())
                    }
                    
                        .onHover { hover in
                            settingsTipVisible = hover
                        }
                        .popoverView(content: {Text("Go to settings").foregroundColor(.white)}, background: {SelectedThemeColors2().fontSecondaryColour.opacity(0.6)}, isPresented: $settingsTipVisible, frame: .constant(CGRect(x: 200, y: 0, width: 120, height: 30)), anchorFrame: nil, popoverType: .popout, position: .left, viewId: "thirdPopover", settings: DYPopoverViewSettings(arrowLength: 10, offset: CGSize(width: -3, height: 18)))
                    
                }
                .frame(height: 30, alignment: .center)
                .padding([.bottom],10)
                if showSfSymbols == true {
                    IconCategoriesView(
                        iconsInCategories: symbols,
                        scrolledToCategoryName: $scrolledToCategoryName,
                        visibleCategoryName: $visibleCategoryName,
                        visibleCategoryPercentageFromBeginning: $visibleCategoryPercentageFromBeginning,
                        iconTapAction: self.iconTapAction
                    )
                    
                    IconCategoriesMenuView(
                        iconsInCategories: symbols,
                        scrolledToCategoryName: $scrolledToCategoryName, visibleCategoryPercentageFromBeginning: $visibleCategoryPercentageFromBeginning,
                        visibleCategoryName: self.visibleCategoryName
                    )
                        .offset(x:-8, y: -2)
                } else {
                    IconCategoriesView(
                        iconsInCategories: emojis.emojis,
                        scrolledToCategoryName: $scrolledToCategoryName,
                        visibleCategoryName: $visibleCategoryName,
                        visibleCategoryPercentageFromBeginning: $visibleCategoryPercentageFromBeginning,
                        iconTapAction: self.iconTapAction
                    )
                    
                    IconCategoriesMenuView(
                        iconsInCategories: emojis.emojis,
                        scrolledToCategoryName: $scrolledToCategoryName, visibleCategoryPercentageFromBeginning: $visibleCategoryPercentageFromBeginning,
                        visibleCategoryName: self.visibleCategoryName
                    )
                        .offset(x:-8, y: -2)
                }
//                .frame(height: 290, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                
                HStack {
                    SearchBar(
                        text: $searchIconName,
                        searchFieldTitle: searchFieldTitle != nil ? searchFieldTitle! : "Search icons"
                    )
                    .padding(10)
                    .background(SelectedThemeColors2().bgSecondaryColour)
                    .foregroundColor(SelectedThemeColors2().fontSecondaryColour)
                    .cornerRadius(10)
                    .environmentObject(SelectedThemeColors())
                    .background(
                        Rectangle()
                            .fill(SelectedThemeColors2().bgMainColour)
                            .frame(width: 450, height: 57))
//                    .frame(width: 420, height: 65, alignment: .top)
                    //                .offset(x: -20)
                }
                .frame(width: 410)
            }
            .padding(10)
//            .padding([.top], 5)
//            .background(SelectedThemeColors2().bgMainColour)
            .frame(width: 410)
            
            if self.searchIconName.count > 2 {
                IconPickerSearchResults(
                    searchIconName: $searchIconName,
                    iconTapAction: self.iconTapAction
                )
                .offset(x: -3, y: 99)
                .environmentObject(self.emojis)
            }
        }
        .padding([.leading], 20)
        .zIndex(0)
        .background(Rectangle()
                        .fill(SelectedThemeColors2().bgMainColour)
                        .frame(width: 440, height: 326),
                    alignment: .top)
        .frame(width: 440, height: 422, alignment: .top)
    }
}


//struct IconPickerView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        func printString(string: String) -> Void {
//            print(string)
//        }
//        
//        func printTag(tag: Tag) -> Void {
//            print(tag.name)
//        }
//        
//        let tag = Tag(context: PersistenceController.preview.container.viewContext)
//        
//        return IconPickerView(
//            iconTapAction: printString,
//            headerView: AnyView(TagWithAdditionalActionView(tag: tag, additionalAction: printTag, actionImageName: "pencil", actionImageColor: .yellow)),
//            triggerSizeAndCoordinates: CGRect(x: 27.0, y: 481.0, width: 100.0, height: 20.0),
//            connectorColor: Color.orange)
//            .environmentObject(SelectedThemeColors())
//            .environmentObject(Emojis())
//    }
//}
