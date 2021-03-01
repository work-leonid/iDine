//
//  ContentView.swift
//  iDine
//
//  Created by Leonid on 28.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { itemSection in
                    Section(header: Text(itemSection.name)) {
                        ForEach(itemSection.items) { item in
                            ItemRowView(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
