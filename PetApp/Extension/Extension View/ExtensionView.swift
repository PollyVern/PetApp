//
//  ExtensionView.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 29.01.2025.
//

import SwiftUI

extension View {

    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
