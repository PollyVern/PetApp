//
//  ExtensionImage.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 26.01.2025.
//

import SwiftUI

extension Image {

    public init(named: AssetsImageModel) {
        self.init(named.rawValue)
    }
}
