//
//  BubbleShape.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//


import SwiftUI

// Mesaj balonu şekli
struct BubbleShape: Shape {
    let isUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [
                .topLeft,
                .topRight,
                isUser ? .bottomLeft : .bottomRight
            ],
            cornerRadii: CGSize(width: 16, height: 16)
        )
        return Path(path.cgPath)
    }
}

