//
//  OpenAIService.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//
import Foundation

protocol ChatServiceProtocol {
    func sendMessage(_ message: String) async throws -> String
}

class OpenAIService: ChatServiceProtocol {
    private let baseURL = "https://api.openai.com/v1/chat/completions"
    
    private var apiKey: String? {
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
           let dict = NSDictionary(contentsOfFile: path),
           let key = dict["OPENAI_API_KEY"] as? String {
            return key
        }
        
        // Eğer plist içinde bulunamazsa, çevresel değişkenlerden al
        return ProcessInfo.processInfo.environment["OPENAI_API_KEY"]
    }
    
    func sendMessage(_ message: String) async throws -> String {
        guard let apiKey = apiKey else {
            throw NSError(domain: "OpenAIService", code: 401, userInfo: [NSLocalizedDescriptionKey: "API anahtarı bulunamadı."])
        }
        
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        let messageData = ChatMessage(role: "user", content: message)
        let requestData = ChatRequest(model: "gpt-3.5-turbo", messages: [messageData])
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(requestData)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(ChatResponse.self, from: data)
        
        return response.choices.first?.message.content ?? "Üzgünüm, bir cevap alamadım."
    }
}
