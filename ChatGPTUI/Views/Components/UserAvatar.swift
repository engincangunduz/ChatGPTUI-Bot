//
//  UserAvatar.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//

import SwiftUI

// Kullanıcı avatarı
struct UserAvatar: View {
    var body: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(.userBubble)
    }
}
