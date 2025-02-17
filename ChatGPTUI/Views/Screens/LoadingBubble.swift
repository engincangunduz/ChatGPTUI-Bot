//
//  LoadingBubble.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//
import SwiftUI

// Yükleme animasyonu
struct LoadingBubble: View {
    @State private var isAnimating = false
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<3) { index in
                Circle()
                    .fill(Color.white)
                    .frame(width: 8, height: 8)
                    .opacity(isAnimating ? 0.3 : 1)
                    .animation(
                        Animation.easeInOut(duration: 0.5)
                            .repeatForever()
                            .delay(0.2 * Double(index)),
                        value: isAnimating
                    )
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.aiBubble)
        .clipShape(Capsule())
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    LoadingBubble()
}
