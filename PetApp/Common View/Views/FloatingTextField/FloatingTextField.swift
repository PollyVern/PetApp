//
//  FloatingTextField.swift
//  PetApp
//
//  Created by Polina Belovodskaya on 28.01.2025.
//

import SwiftUI

struct FloatingTextField: View {
    
    // init
    @Binding var text: String
    private let model: FloatingTextFieldModel
    
    // properties
    @State private var isFirstResponder: Bool = false
    @FocusState private var isFocusState: Bool
    
    init(text: Binding<String>, model: FloatingTextFieldModel) {
        self._text = text
        self.model = model
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            background()
            
            VStack(spacing: 0) {
                floatingTitle()
                
                if isFirstResponder || !text.isEmpty {
                    textField()
                }
                
            }
            .padding(.bottom, 10)
            .padding(.top, 10)
            
        }
        .padding([.leading, .trailing], 20)
    }
}

private extension FloatingTextField {
    func background() -> some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.white)
            .frame(height: 50)
    }
    
    
    func floatingTitle() -> some View {
        HStack(alignment: .center) {
            Button(action: {
                withAnimation {
                    isFirstResponder.toggle()
                    isFocusState.toggle()
                }
            } ) {
                Text(NSLocalizedString("\(model.floatingText)", comment: ""))
                    .foregroundColor(.blue_darkColor)
                    .padding([.leading, .trailing], 20)
                    .frame(width: 300, height: isFirstResponder || !text.isEmpty ? 12 : 30, alignment: .leading)
                    .font(isFirstResponder || !text.isEmpty ? .subheadline : .title3)
            }
            .onChange(of: isFocusState) { _, _ in
                if !isFocusState { isFirstResponder.toggle() }
            }
            .disabled(text.isEmpty ? false : true)
            Spacer()
        }
    }
    
    
    func textField() -> some View {
        HStack(alignment: .top) {
            TextField("", text: $text)
                .focused($isFocusState)
                .accentColor(.blue_darkColor)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .foregroundColor(.blue_darkColor)

        }
        .padding([.leading, .trailing], 20)
        
    }
}

#Preview {
    @Previewable @State var name = ""
    ZStack {
        Color.gray
            .ignoresSafeArea()
        FloatingTextField(text: $name,
                          model: FloatingTextFieldModel(floatingText: "Floating Text"))
    }
}
