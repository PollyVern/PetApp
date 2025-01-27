//
//  HomeView.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 27.01.2025.
//

import SwiftUI

struct HomeView: View {
    
    // ViewModel
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    
    // Navigation
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        Color.red
            .edgesIgnoringSafeArea(.all)
    }
}
