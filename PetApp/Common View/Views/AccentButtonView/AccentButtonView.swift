//
//  AccentButtonView.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 27.01.2025.
//

import SwiftUI

struct AccentButtonView: View {

    private let model: AccentButtonModel
    private let action: () -> Void

    init(model: AccentButtonModel, action: @escaping () -> Void) {
        self.model = model
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack {
                Text(NSLocalizedString("\(model.mainText)", comment: ""))
                    .font(.headline)
                Image(systemName: model.systemImageText)
            }
            .foregroundColor(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(backgroundView())
            .cornerRadius(10)
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: ConstantsUI.bottomPadding, trailing: 20))
    }
}

private extension AccentButtonView {
    func backgroundView() -> some View {
        VisualEffectBlur(blurStyle: .extraLight)
            .opacity(0.8)
    }
}

#Preview {
    OnboardingView()
}
