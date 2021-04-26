//
//  SettingsScreen.swift
//  SwiftUIChatClient
//
//  Created by Vadim Zahariev on 26.04.21.
//

import SwiftUI

struct SettingsScreen: View {
    @EnvironmentObject private var userInfo: UserInfo
    
    private var isUsernameValid: Bool {
        !userInfo.username.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        Form {
            Section(header: Text("Username")) {
                TextField("E.g. Jhon Applesheed", text: $userInfo.username)
                
                NavigationLink("Continue", destination: ChatScreen())
                    .disabled(!isUsernameValid)
            }
        }
        .navigationTitle("Settings")
        
    }
    
}
