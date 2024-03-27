//
//  GameBoardDataModel.swift
//  game
//
//  Created by yucian huang on 2024/2/18.
//

import SwiftUI

class GameBoardDataModel: ObservableObject {
    
    @Published var board: [BlockState] = []
    @Published var turn: PlayerState?
    @Published var winner: PlayerState?
    
    
    // MARK: Start
    
    init() {
        newGame()
    }
    
    func newGame() {
        
        board = []
        winner = nil
        
        for _ in 0..<9 {
            board.append(.empty)
        }
        
        let coinFlip = Bool.random()
        
        if coinFlip {
            turn = .playerCircle
        } else {
            turn = .playerCross
        }
    }
    
    // MARK: Make move logic
    // update board based on the player's turn
    
    func makeMove(forIndex: Int) {
        
        
        // Check if the board is occupied
        if forIndex >= 0 && forIndex < board.count && board[forIndex] != .empty {
            return    // stop the function
        }

        
        if (turn == .playerCircle) {
            board[forIndex] = .circle
            turn = .playerCross
        } else if (turn == .playerCross) {
            board[forIndex] = .cross
            turn = .playerCircle
        }
        
        checkWinner()
    }
    
    func checkWinner() {
        // MARK: Winner Circle Situation
        if (board[0] == .circle && board[1] == .circle && board[2] == .circle) {
            winner = .playerCircle
        } else if (board[3] == .circle && board[4] == .circle && board[5] == .circle) {
            winner = .playerCircle
        } else if (board[6] == .circle && board[7] == .circle && board[8] == .circle) {
            winner = .playerCircle
        } else if (board[0] == .circle && board[3] == .circle && board[6] == .circle) {
            winner = .playerCircle
        } else if (board[1] == .circle && board[4] == .circle && board[7] == .circle) {
            winner = .playerCircle
        } else if (board[2] == .circle && board[5] == .circle && board[8] == .circle) {
            winner = .playerCircle
        } else if (board[0] == .circle && board[4] == .circle && board[8] == .circle) {
            winner = .playerCircle
        } else if (board[2] == .circle && board[4] == .circle && board[6] == .circle) {
            winner = .playerCircle
        
        // MARK: Winner Cross Situation
        } else if (board[0] == .cross && board[1] == .cross && board[2] == .cross) {
            winner = .playerCross
        } else if (board[3] == .cross && board[4] == .cross && board[5] == .cross) {
            winner = .playerCross
        } else if (board[6] == .cross && board[7] == .cross && board[8] == .cross) {
            winner = .playerCross
        } else if (board[0] == .cross && board[3] == .cross && board[6] == .cross) {
            winner = .playerCross
        } else if (board[1] == .cross && board[4] == .cross && board[7] == .cross) {
            winner = .playerCross
        } else if (board[2] == .cross && board[5] == .cross && board[8] == .cross) {
            winner = .playerCross
        } else if (board[0] == .cross && board[4] == .cross && board[8] == .cross) {
            winner = .playerCross
        } else if (board[2] == .cross && board[4] == .cross && board[6] == .cross) {
            winner = .playerCross
            
            
        // MARK: Winner No One Situation
        } else if !board.contains(.empty) && winner != .playerCross && winner != .playerCircle {
            winner = .PlayerNoOne
        }
        
    }
     
    
}
