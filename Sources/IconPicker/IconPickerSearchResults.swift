//
//  IconPickerSearchResults.swift
//  PPL
//
//  Created by Michal Jendrzejewski on 09/07/2021.
//

import SwiftUI

struct IconPickerSearchResults: View {
    @Binding var searchIconName:String
    var iconTapAction: (_ iconName: String) -> Void
    @State var searchResults:[String] = []
    
    @State private var allIconsArray: [String] = []
    let rows = [
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0),
        GridItem(.fixed(40.00), spacing: 0)
    ]
    private let gridSpacing = 10
    
    
    @EnvironmentObject var emojis: Emojis
    
    
    func setSearchResults() -> Void {
        let emojiResultsBasedOnDescription:[String] = emojis.allEmojisFlattenWithData.filter({$0.description.lowercased().contains(self.searchIconName.lowercased())}).map({$0.emoji})
        
        let emojiResultsBasedOnKeywords:[String] = emojis.allEmojisFlattenWithData.filter({$0.keywords.contains(self.searchIconName.lowercased())}).map({$0.emoji})
        
        let sfSymbolsResults:[String] = self.allIconsArray.filter({$0.contains(self.searchIconName.lowercased())})
        
        let emojiAndSfSymbolsResults = emojiResultsBasedOnDescription + emojiResultsBasedOnKeywords + sfSymbolsResults
        
        self.searchResults = emojiAndSfSymbolsResults.removingDuplicates().shuffled()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if self.searchResults.count > 0 {
                HStack {
                    Text("Results for ") + Text(self.searchIconName).bold() + Text(":")
                    Spacer()
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(SelectedThemeColors2().listHeaderColour)
                        .onTapGesture {
                            self.searchIconName = ""
                        }
                }
                
                ScrollView {
                    LazyVGrid(columns: rows, spacing: CGFloat(gridSpacing)) {
                        //                List{
                        ForEach(self.searchResults, id: \.self) { icon in
                            
                            IconView(iconString: icon, showIconCategoryColor: true)
                                .onTapGesture {
                                    self.iconTapAction(icon)
                                }
                        }
                    }
                }
            } else {
                HStack {
                    Text("No icons for ") + Text(self.searchIconName).bold() + Text(":(")
                    Spacer()
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(SelectedThemeColors2().fontSecondaryColour)
                        .onTapGesture {
                            self.searchIconName = ""
                        }
                }
            }
//
        }
        .padding()
        .frame(minWidth: 0, maxWidth: 260, minHeight: 0, maxHeight: self.searchResults.count > 0 ? 275 : 40)
        .background(Color.white.opacity(0.8))
        .cornerRadius(15)
//                .border()
        .animation(.easeIn)
        .foregroundColor(SelectedThemeColors2().listHeaderColour)
        .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(SelectedThemeColors2().fontSecondaryColour.opacity(0.8), lineWidth: 1)
        )
        .onChange(of: self.searchIconName, perform: { value in
            self.setSearchResults()
        })
        .onAppear{
            for (_, value) in symbols {
                allIconsArray += value
            }
            
            allIconsArray = Array(Set(allIconsArray))
            self.setSearchResults()
        }
    }
}

struct IconPickerSearchResults_Previews: PreviewProvider {
    static var previews: some View {
        func printString(string: String) -> Void {
            print(string)
        }
        return IconPickerSearchResults(
            searchIconName: .constant("flower"),
            iconTapAction: printString
        )
        .environmentObject(SelectedSelectedThemeColors2())
        .environmentObject(Emojis())
    }
}
