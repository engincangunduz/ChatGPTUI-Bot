//
//  ChatView.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//
import SwiftUI

// Ana ChatView
struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel(service: OpenAIService())
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HeaderView()
            
            // Messages
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.messages) { message in
                            MessageBubble(message: message)
                                .id(message.id)
                        }
                    }
                }
                .onChange(of: viewModel.messages.count) { _ in
                    if let lastMessage = viewModel.messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color.chatBackground)
            
            // Input area
            InputView(
                text: $viewModel.currentInput,
                isFocused: _isFocused,
                onSend: {
                    viewModel.sendMessage()
                }
            )
        }
        .background(Color.chatBackground)
    }
}

#Preview {
    ChatView()
}
