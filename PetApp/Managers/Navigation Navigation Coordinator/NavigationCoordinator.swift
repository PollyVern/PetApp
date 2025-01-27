//
//  NavigationCoordinator.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 23.01.2025.
//

import SwiftUI

final class NavigationCoordinator: ObservableObject {
    
    @Published var path: [NavigationRouter] = []

    func navigateTo(_ screen: NavigationRouter) {
        path.append(screen)
    }
}
