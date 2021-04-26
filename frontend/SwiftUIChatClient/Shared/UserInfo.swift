//
//  UserInfo.swift
//  SwiftUIChatClient
//
//  Created by Vadim Zahariev on 26.04.21.
//

import Foundation
import Combine

class UserInfo: ObservableObject {
    let userID = UUID()
    @Published var username = ""
}

