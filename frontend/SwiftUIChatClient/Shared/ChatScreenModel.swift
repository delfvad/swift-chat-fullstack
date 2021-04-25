//
//  ChatScreenModel.swift
//  SwiftUIChatClient
//
//  Created by Vadim Zahariev on 24.04.21.
//

import Combine
import Foundation

final class ChatScreenModel: ObservableObject {
    private var webSocketTask: URLSessionWebSocketTask?
    @Published private(set) var messages: [ReceivingChatMessage] = []
    
    // MARK: - Sending message
    func send(text: String) {
        let message = SubmittedChatMessage(message: text)
        guard let json = try? JSONEncoder().encode(message), let jsonString = String(data: json, encoding: .utf8) else { return }
        
        webSocketTask?.send(.string(jsonString)) { error in
            if let error = error {
                print("Error sending message", error)
            }
        }
    }
    
    // MARK: - Connection
    func connect() {
        let url = URL(string: "ws://127.0.0.1:8080/chat")!
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.receive(completionHandler: onReceive)
        webSocketTask?.resume()
    }
    
    func dissconnect() {
        webSocketTask?.cancel(with: .normalClosure, reason: nil)
    }
    
    private func onReceive(incoming: Result<URLSessionWebSocketTask.Message, Error>) {
        // Nothing yet...
    }
    
    deinit {
        dissconnect()
    }
    
}

