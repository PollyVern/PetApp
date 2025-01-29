//
//  ContentView.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 27.01.2025.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var coordinator = NavigationCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            OnboardingView()
                .navigationDestination(for: NavigationRouter.self) { scenes in
                    switch scenes {
                    case .home:
                        HomeView()
                    case .name:
                        NameView()
                    }
                }
        }
        .environmentObject(coordinator)
    }
}
