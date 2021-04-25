//
//  Models.swift
//  SwiftUIChatClient
//
//  Created by Vadim Zahariev on 24.04.21.
//

import Foundation

import Foundation

struct SubmittedChatMessage: Encodable {
    let message: String
}

struct ReceivingChatMessage: Decodable, Identifiable {
    let id: UUID
    let date: Date
    let message: String
}
