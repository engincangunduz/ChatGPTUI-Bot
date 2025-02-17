//
//  ChatViewModel.swift
//  ChatGPTUI
//
//  Created by Engin Gündüz on 15.02.2025.
//
import Foundation


class ChatViewModel: ObservableObject {
    @Published var messages: [MessageModel] = []
    @Published var currentInput: String = ""
    
    private let openAIService: OpenAIService
        
    init(service: OpenAIService) {
        self.openAIService = service
    }
    
    @MainActor
    func sendMessage() {
        let userMessage = currentInput
        currentInput = ""
        
        // Kullanıcı mesajını ekle
        messages.append(MessageModel(content: userMessage, isUser: true))
        
        // Loading durumunu göster
        messages.append(MessageModel(content: "Düşünüyor...", isUser: false, isLoading: true))
        
        // API çağrısını arka planda yap
        Task {
            do {
                // API'den cevap al
                let response = try await openAIService.sendMessage(userMessage)
                
                // Main thread'de UI'ı güncelle
                await MainActor.run {
                    // Loading mesajını kaldır
                    messages.removeLast()
                    
                    // AI cevabını ekle
                    messages.append(MessageModel(content: response, isUser: false))
                }
            } catch {
                await MainActor.run {
                    // Loading mesajını kaldır
                    messages.removeLast()
                    
                    // Hata mesajını ekle
                    messages.append(MessageModel(content: "Bir hata oluştu: \(error.localizedDescription)", isUser: false))
                }
            }
        }
    }
}
