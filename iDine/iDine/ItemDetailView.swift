//
//  ItemDetailView.swift
//  iDine
//
//  Created by Leonid on 28.02.2021.
//

import SwiftUI

struct ItemDetailView: View {
    let item: MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .font(.caption)
                    .padding(5)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
            Spacer()
        }
        .navigationBarTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: MenuItem.example)
    }
}
