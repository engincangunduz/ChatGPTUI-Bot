//
//  InputView.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//

import SwiftUI
// Input komponenti
struct InputView: View {
    @Binding var text: String
    @FocusState var isFocused: Bool
    var onSend: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            TextField("Mesajınızı yazın...", text: $text)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(Color.inputBackground)
                .cornerRadius(20)
                .focused($isFocused)
                .foregroundColor(.white)
            
            Button(action: {
                onSend()
                isFocused = false
            }) {
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(text.isEmpty ? Color.aiBubble : Color.userBubble)
                    .clipShape(Circle())
            }
            .disabled(text.isEmpty)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.chatBackground)
    }
}
