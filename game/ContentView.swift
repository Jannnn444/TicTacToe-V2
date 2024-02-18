//
//  ContentView.swift
//  game
//
//  Created by yucian huang on 2024/2/18.
//

import SwiftUI

struct ContentView: View {
    
    @State var showModel = false
    @EnvironmentObject var gameboardDM: GameBoardDataModel
    
    var gridBlockSize: CGFloat = 80
    var blockSpacing: CGFloat = 5
    
    
    
    var body: some View {
        
        ZStack{
            
            Spacer()
            
            VStack {
                Spacer()
                
                //MARK: Game Title
                HStack {
                    Image(systemName: "dog.fill")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                    Image(systemName: "cat.fill")
                        .imageScale(.large)
                        .foregroundColor(.pink)
                }
                
                
                Text("Tic-Tac-Toe")
                    .font(.system(size: 50, weight: .bold))
                    .fontDesign(.rounded)
                    .padding(.bottom, 60)
                    
                
                
                //MARK: Show the PlayerTurn
                HStack {
                    
                    
                    if gameboardDM.turn == .playerCircle {
                        Text("Player O")
                            .font(.system(size: 28, weight: .bold ))
                            .fontDesign(.monospaced)
                        Image(systemName: "cat.fill")
                    } else {
                        Text("Player X")
                            .font(.system(size: 28, weight: .bold))
                            .fontDesign(.monospaced)
                        Image(systemName: "dog.fill")
                    }
                }
                
                // MARK: Game Board Blocks
                Grid(horizontalSpacing: blockSpacing, verticalSpacing: blockSpacing) {
                    
                    // Loops
                    
                    ForEach(0..<3, id: \.self ) { rowIndex in
                        GridRow {
                            ForEach(0..<3, id:  \.self) { columnIndex in
                                
                                
                                ZStack {
                                    Color(.systemBlue)
                                        .frame(width: gridBlockSize, height: gridBlockSize)
                                    
                                    
                                    // MARK: Draw in the mark o/x
                                    if rowIndex * 3 + columnIndex < gameboardDM.board.count && gameboardDM.board[rowIndex * 3 + columnIndex] == BlockState.circle

                                    {  Image(systemName: "circle")
                                            .resizable()
                                            .foregroundColor(.yellow)
                                            .frame(width: gridBlockSize - 5, height: gridBlockSize - 5)
                                    }
                                    
                                    else if rowIndex * 3 + columnIndex < gameboardDM.board.count && gameboardDM.board[rowIndex * 3 + columnIndex] == BlockState.cross
                                                
                                    {  Image(systemName: "xmark")   //createImage here
                                            .resizable()
                                            .foregroundColor(.orange)
                                            .frame(width: gridBlockSize - 7, height: gridBlockSize - 7)
                                    }
                                }
                                .onTapGesture {
                                    gameboardDM.makeMove(forIndex: rowIndex*3 + columnIndex)
                                }
                            }
                        }
                        
                    }
                    
                    
                }
                Spacer()
                
            }
            
            // MARK: Show Game Result Module on ZStack
            if gameboardDM.winner == .playerCircle {
                GameResultView()
            } else if gameboardDM.winner == .playerCross {
                GameResultViewCross()
            } else if gameboardDM.winner == .PlayerNoOne  {
                GameResultViewNoOneWon()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView().environmentObject(GameBoardDataModel())
}
