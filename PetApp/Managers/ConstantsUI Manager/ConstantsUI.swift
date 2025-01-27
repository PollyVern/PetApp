//
//  ConstantsUI.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 26.01.2025.
//

import SwiftUI

struct ConstantsUI {
    static let screenHeight = UIScreen.main.bounds.height

    /** Change in Share extension if needed */
    static let bottomPadding: CGFloat = {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 30.0
        } else {
            return UIApplication.shared.keyWindowWithoutFilter?.safeAreaInsets.bottom ?? 0
        }
    }()
}
