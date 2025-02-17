//
//  UIExtension.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//

import Foundation
import UIKit
import SwiftUI

// Custom renk tanımlamaları için extension
extension Color {
    static let chatBackground = Color(hex: "1A1A1A")
    static let userBubble = Color(hex: "007AFF")
    static let aiBubble = Color(hex: "2C2C2E")
    static let inputBackground = Color(hex: "2C2C2E")
}

// Hex renk desteği için extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
