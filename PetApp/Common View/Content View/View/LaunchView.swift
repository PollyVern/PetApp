//
//  ContentView.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 23.01.2025.
//

import SwiftUI

struct LaunchView: View {

    @StateObject var navigationManager = NavigationManager()

    // ViewModel
    @StateObject private var viewModel: ContentViewModel = ContentViewModel()

    var body: some View {
        ZStack {
            backgroundColor()
            titleText()
            catImage()
        }
        .ignoresSafeArea()
    }
}

// MARK: - Private extension: VIEW
private extension LaunchView {
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
}

// MARK: - Private extension
private extension LaunchView {
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
    LaunchView()
        .modelContainer(for: Item.self, inMemory: true)
}
