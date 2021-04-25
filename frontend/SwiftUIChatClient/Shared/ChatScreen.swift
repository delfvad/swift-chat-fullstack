//
//  ChatScreen.swift
//  SwiftUIChatClient
//
//  Created by Vadim Zahariev on 24.04.21.
//

import SwiftUI

struct ChatScreen: View {
    @StateObject private var model = ChatScreenModel()
    @State private var message = ""
    
    private func onCommit() {
        if !message.isEmpty {
            model.send(text: message)
            message = ""
        }
    }
    
    var body: some View {
        VStack {
            // Messages list
            ScrollView {
                Text("Scroll View!")
                    .padding()
            }
            .onAppear{model.connect()}
            .onDisappear{model.dissconnect()}
            
            // Message field
            HStack {
                TextField("Message", text: $message, onEditingChanged: {_ in}, onCommit: onCommit)
                    .padding(10)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(5)
                
                Button(action: onCommit) {
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.system(size: 20))
                }
                .padding()
                .disabled(message.isEmpty)
            }
            .padding()
        }
    }
    
}
