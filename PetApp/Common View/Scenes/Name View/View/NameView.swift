//
//  NameView.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 28.01.2025.
//

import SwiftUI

struct NameView: View {

    // ViewModel
    @StateObject private var viewModel: NameViewModel = NameViewModel()

    // Properties
    @State private var name: String = ""

    // Navigation
    @EnvironmentObject var coordinator: NavigationCoordinator

    // Managers
    @StateObject private var keyboardManager: KeyboardManager = KeyboardManager()


    var body: some View {
        GeometryReader { geometry in
            ZStack {
                backgroundColor()
                titleText()
                catImage()
                fieldView()
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .onTapGesture(perform: {
                self.endTextEditing()
            })
            .onAppear {
                keyboardManager.addKeyboardObservers()
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Private extension: VIEW
private extension NameView {
    func backgroundColor() -> some View {
        Color.yellow_lightColor
            .edgesIgnoringSafeArea(.all)
    }

    func titleText() -> some View {
        return VStack {
            Text(createTitle())
            .font(.largeTitle)
            .foregroundColor(.blue_darkColor)
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 0)
        }
    }

    func catImage() -> some View {
        VStack {
            Spacer()
            Image(named: .png_catBrownHead)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                .frame(height: ConstantsUI.screenHeight * 0.8)
        }
        .ignoresSafeArea()
    }

    func fieldView() -> some View {
        VStack {
            Spacer()
            FloatingTextField(text: $name, model: FloatingTextFieldModel(floatingText: "name_view_floating_title"))
                .padding(.bottom, keyboardManager.keyboardHeight)
                .animation(.easeInOut(duration: 0.3), value: keyboardManager.keyboardHeight)
        }
    }
}

// MARK: - Private extension
private extension NameView {
    func createTitle() -> String {
        let textBuilder: TextBuilderProtocol = TextBuilder(key: "name_view_title")
        let text = textBuilder
            .start()
            .replacingOccurrences("\n")
            .finish()
        return text
    }
}

#Preview {
    NameView()
        .modelContainer(for: Item.self, inMemory: true)
}
