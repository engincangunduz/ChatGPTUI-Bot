//
//  HeaderView.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//

import SwiftUI

// Header komponenti
struct HeaderView: View {
    var body: some View {
        HStack {
            Text("ChatGPT")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.chatBackground)
    }
}
