//
//  NasaAPIApp.swift
//  NasaAPI
//
//  Created by Mark Vadimov on 22.05.24.
//

import SwiftUI

@main
struct NasaAPIApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
