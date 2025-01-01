//
//  furniture_ecomm_appApp.swift
//  furniture-ecomm-app
//
//  Created by Sergio Herrera on 12/26/24.
//

import SwiftUI

@main
struct furniture_ecomm_appApp: App {
    @StateObject var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
        }
    }
}
