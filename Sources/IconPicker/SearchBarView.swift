//
//  SwiftUIView.swift
//  PPL
//
//  Created by Macbook Pro on 25/11/2020.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    var searchFieldTitle: String?
    @State private var isEditing = false
    
 
    var body: some View {
        HStack {
 
            TextField(searchFieldTitle != nil ? searchFieldTitle! : "Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(SelectedThemeColors2().fontSecondaryColour)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                print("x")
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(SelectedThemeColors2().fontSecondaryColour)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(
            text: .constant(""),
            searchFieldTitle: "dupa"
        )
            .environmentObject(SelectedThemeColors())
    }
}
