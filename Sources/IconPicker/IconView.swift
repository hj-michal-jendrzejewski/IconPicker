//
//  IconView.swift
//  PPL
//
//  Created by Michal Jendrzejewski on 30/07/2021.
//

import SwiftUI

struct IconView: View {
    var iconString: String
    var showIconCategoryColor: Bool?
    @EnvironmentObject var emojis: Emojis
    
    func getIconCategoryColor(iconName: String) -> Color {
        var iconCategory:String = ""
        
        if symbols.first(where: { $0.value.contains(iconName) })?.key != nil {
            iconCategory = symbols.first(where: { $0.value.contains(iconName) })!.key
        } else {
            iconCategory = emojis.emojis.first(where: { $0.value.contains(iconName) })!.key
        }
        
        return categoriesRainbowColors[iconCategory]!.opacity(0.7)
    }
    
    var body: some View {
        if ((Unicode.Scalar(iconString)?.properties.isEmoji) != nil) {
            Text(iconString)
            
        } else {
            if showIconCategoryColor == true {
                Image(systemName: iconString)
                    .foregroundColor(getIconCategoryColor(iconName: iconString))
            } else {
                Image(systemName: iconString)
            }
        }
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(iconString: "🦀")
    }
}
