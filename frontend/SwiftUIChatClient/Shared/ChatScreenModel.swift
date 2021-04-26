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
    private var username: String?
    private var userID: UUID?
    
    // MARK: - Sending message
    func send(text: String) {
        let message = SubmittedChatMessage(
        guard let json = try? JSONEncoder().encode(message), let jsonString = String(data: json, encoding: .utf8) else { return }
        
        webSocketTask?.send(.string(jsonString)) { error in
            if let error = error {
                print("Error sending message", error)
            }
        }
    }
    
    // MARK: - Reciving message
    private func onReceive(incoming: Result<URLSessionWebSocketTask.Message, Error> ) {
        webSocketTask?.receive(completionHandler: onReceive)
        
        if case .success(let message) = incoming {
            onMessage(message: message)
        } else if case .failure(let error) = incoming {
            print("Error", error)
        }
    }
    
    private func onMessage(message: URLSessionWebSocketTask.Message) {
        if case .string(let text) = message {
            guard let data = text.data(using: .utf8), let chatMessage = try? JSONDecoder().decode(ReceivingChatMessage.self, from: data)
                else { return }
            
            DispatchQueue.main.async {
                self.messages.append(chatMessage)
            }
        }
    }
    
    // MARK: - Connection
    func connect(username: String, userID: UUID) {
        self.username = username
        self.userID = userID
        let url = URL(string: "ws://127.0.0.1:8080/chat")!
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.receive(completionHandler: onReceive)
        webSocketTask?.resume()
    }
    
    func dissconnect() {
        webSocketTask?.cancel(with: .normalClosure, reason: nil)
    }
    
    deinit {
        dissconnect()
    }
    
}

