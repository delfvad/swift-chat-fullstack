//
//  Models.swift
//  
//
//  Created by Vadim Zahariev on 24.04.21.
//

import Foundation

struct SubmittedChatMessage: Decodable {
    let message: String
}

struct ReceivingChatMessage: Encodable, Identifiable {
    let id = UUID()
    let date = Date()
    let message: String
}
