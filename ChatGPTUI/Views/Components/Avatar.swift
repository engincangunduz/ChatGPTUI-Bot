//
//  Avatar.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//

import SwiftUI

// Avatar komponenti
struct Avatar: View {
    var body: some View {
        Image(systemName: "brain.head.profile")
            .resizable()
            .frame(width: 30, height: 30)
            .padding(8)
            .foregroundColor(.white)
            .background(Color.aiBubble)
            .clipShape(Circle())
    }
}
