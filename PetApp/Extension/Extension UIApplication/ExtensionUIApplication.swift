//
//  ExtensionUIApplication.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 27.01.2025.
//

import SwiftUI

extension UIApplication {

    var keyWindowWithoutFilter: UIWindow? {
        // Get connected scenes
        return self.connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }
    }
    
}
