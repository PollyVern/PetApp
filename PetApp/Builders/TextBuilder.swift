//
//  TextBuilder.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 26.01.2025.
//

protocol TextBuilderProtocol {

    func start() -> TextBuilderProtocol
    func replacingOccurrences(_ symbol: String) -> TextBuilderProtocol
    func addSymbolAtFirst(_ symbol: String) -> TextBuilderProtocol
    func finish() -> String
}

class TextBuilder {

    var text: String

    init(key: String) {
        self.text = key.localized()
    }
}

// MARK: - Self protocol
extension TextBuilder: TextBuilderProtocol {

    func start() -> TextBuilderProtocol {
        return self
    }

    func replacingOccurrences(_ symbol: String) -> TextBuilderProtocol {
        text = text.replacingOccurrences(of: " ", with: "\n")
        return self
    }

    func addSymbolAtFirst(_ symbol: String) -> TextBuilderProtocol {
        text = symbol + text
        return self
    }

    func finish() -> String {
        return text
    }
}
