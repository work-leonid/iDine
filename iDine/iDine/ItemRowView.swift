//
//  ItemRowView.swift
//  iDine
//
//  Created by Leonid on 28.02.2021.
//

import SwiftUI

struct ItemRowView: View {
    let item: MenuItem
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    
    var body: some View {
        NavigationLink(destination: ItemDetailView(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.gray, lineWidth: 2)
                    )
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("$\(item.price)")
                }
                
                Spacer()
                
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .fontWeight(.black)
                        .font(.caption)
                        .padding(4)
                        .background(colors[restriction, default: .black])
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        
                        
                }
            }
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: MenuItem.example)
    }
}
