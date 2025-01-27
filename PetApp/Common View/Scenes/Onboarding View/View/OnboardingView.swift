//
//  OnboardingView.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 23.01.2025.
//

import SwiftUI

struct OnboardingView: View {

    // ViewModel
    @StateObject private var viewModel: OnboardingViewModel = OnboardingViewModel()

    // Navigation
    @EnvironmentObject var coordinator: NavigationCoordinator

    var body: some View {
        ZStack {
            backgroundColor()
            titleText()
            catImage()
            accentButton()
        }
        .ignoresSafeArea()
    }
}

// MARK: - Private extension: VIEW
private extension OnboardingView {
    func backgroundColor() -> some View {
        Color.blue_lightColor
            .edgesIgnoringSafeArea(.all)
    }

    func titleText() -> some View {
        return (Text(createMainPartTitle()) +
                Text(createBoldPartTitle()).bold())
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding(.leading, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    func catImage() -> some View {
        VStack {
            Spacer()
            Image(named: .png_catGrayHead)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                .frame(height: ConstantsUI.screenHeight * 0.8)
        }
    }

    func accentButton() -> some View {
        VStack {
            Spacer()
            AccentButtonView(model: AccentButtonModel(mainText: "launch_view_accent_button",
                                                      systemImageText: "pawprint.fill")) {
                
                coordinator.navigateTo(.home)
            }
        }
    }
}

// MARK: - Private extension
private extension OnboardingView {
    func createMainPartTitle() -> String {
        let textBuilder: TextBuilderProtocol = TextBuilder(key: "launch_view_header")
        let text = textBuilder
            .start()
            .replacingOccurrences("\n")
            .finish()
        return text
    }

    func createBoldPartTitle() -> String {
        let textBuilder: TextBuilderProtocol = TextBuilder(key: "launch_view_swift_ui")
        let text = textBuilder
            .start()
            .addSymbolAtFirst("\n")
            .finish()
        return text
    }
}

#Preview {
    OnboardingView()
        .modelContainer(for: Item.self, inMemory: true)
}
