//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Vincent Lin on 2021/1/5.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
