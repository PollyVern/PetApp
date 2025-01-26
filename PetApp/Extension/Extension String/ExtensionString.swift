//
//  ExtensionString.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 26.01.2025.
//

import Foundation

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
