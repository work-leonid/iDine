//
//  iDineApp.swift
//  iDine
//
//  Created by Leonid on 28.02.2021.
//

import SwiftUI

@main
struct iDineApp: App {
    
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
