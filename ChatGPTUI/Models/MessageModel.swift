//
//  MessageModel.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//
import Foundation

struct MessageModel: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
    var isLoading: Bool = false
}
