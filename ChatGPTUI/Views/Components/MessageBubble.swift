//
//  MessageBubble.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//
import Foundation
import SwiftUI

struct MessageBubble: View {
    let message: MessageModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            if !message.isUser {
                Avatar()
            }
            
            VStack(alignment: message.isUser ? .trailing : .leading) {
                if message.isLoading {
                    LoadingBubble()
                } else {
                    Text(message.content)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(message.isUser ? Color.userBubble : Color.aiBubble)
                        .foregroundColor(.white)
                        .clipShape(BubbleShape(isUser: message.isUser))
                }
            }
            
            if message.isUser {
                UserAvatar()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//#Preview {
//    MessageBubble()
//}

