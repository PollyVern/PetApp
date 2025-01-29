//
//  KeyboardManager.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 29.01.2025.
//

import SwiftUI
import Combine


class KeyboardManager: ObservableObject {

    // Singleton
    private static let sharedInstance = KeyboardManager()

    public static func shared() -> KeyboardManager {
        return sharedInstance
    }

    @Published var keyboardHeight: CGFloat = ConstantsUI.bottomPadding

}

extension KeyboardManager {
    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: .main) { [weak self] notification in
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                DispatchQueue.main.async {
                    self?.keyboardHeight = keyboardFrame.height - 20 // Немного отступа от клавиатуры
                }
            }
        }

        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: .main) { [weak self] _ in
            DispatchQueue.main.async {
                self?.keyboardHeight = ConstantsUI.bottomPadding
            }
        }
    }
}
