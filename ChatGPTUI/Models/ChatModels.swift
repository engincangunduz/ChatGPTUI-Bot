//
//  ChatModels.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//


struct ChatMessage: Codable {
    let role: String
    let content: String
}

struct ChatRequest: Codable {
    let model: String
    let messages: [ChatMessage]
}

struct ChatResponse: Codable {
    struct Choice: Codable {
        let message: ChatMessage
        let finishReason: String
        
        enum CodingKeys: String, CodingKey {
            case message
            case finishReason = "finish_reason"
        }
    }
    
    let choices: [Choice]
}
