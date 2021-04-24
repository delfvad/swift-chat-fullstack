//
//  File.swift
//  
//
//  Created by Vadim Zahariev on 24.04.21.
//

import Vapor

var env = try Environment.detect()
let app = Application(env)

defer {
    app.shutdown()
}

app.webSocket("chat") { req, client in
    print("Connected:", client)
}

try app.run()
