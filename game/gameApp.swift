//
//  gameApp.swift
//  game
//
//  Created by yucian huang on 2024/2/18.
//

import SwiftUI

@main
struct gameApp: App {
    
    
    @StateObject var gameboardDM = GameBoardDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(gameboardDM)
            
            // environment in our gameDataModel logic
        }
    }
}
