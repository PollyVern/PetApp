//
//  ContentView.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 23.01.2025.
//

import SwiftUI

struct ContentView: View {

    @StateObject var navigationManager = NavigationManager()

    // ViewModel
    @StateObject private var viewModel: ContentViewModel = ContentViewModel()

    var body: some View {
        Color.black
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
