//
//  GameResultView().swift
//  game
//
//  Created by yucian huang on 2024/2/18.
//

import SwiftUI

//@State var title: String = "My Title"


struct GameResultView: View {
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    
    let myModuleDimension: CGFloat = 250
    var body: some View {
        
        ZStack{
            Color(.black)
                .opacity(0.4)
                .ignoresSafeArea()
            // MARK: Module
            VStack{
                HStack{
                    Text("Circle won!")
                    Image(systemName: "trophy.fill")}
                Text("Retry ?")
                    .padding(.top)
                    
                    .font(.system(size: 30, weight: .bold))
                    .fontDesign(.monospaced)
                    .onTapGesture {
                        // RESET GAME
                        gameBoardDM.newGame()
                    }
            }
                .frame(width: myModuleDimension, height: myModuleDimension)
                .background(.white)
                .font(.system(size: 30, weight: .bold))
                .cornerRadius(40)
        }
    }
}

struct GameResultViewCross: View {
    @EnvironmentObject var gameBoardDM: GameBoardDataModel
    let myModuleDimension: CGFloat = 250
    var body: some View {
        ZStack{
            Color(.black)
                .opacity(0.4)
                .ignoresSafeArea()
            // MARK: Module
            VStack{
                HStack{
                    Text("Cross won!")
                    Image(systemName: "trophy.fill")
                }
                Text("Retry ?")
                    .padding(.top)
                    
                    .font(.system(size: 30, weight: .bold))
                    .fontDesign(.monospaced)
                    .onTapGesture {
                        // RESET GAME
                        gameBoardDM.newGame()
                    }
            }
                .frame(width: myModuleDimension, height: myModuleDimension)
                .background(.white)
                .font(.system(size: 30, weight: .bold))
                .cornerRadius(40)
        }
    }
}
struct GameResultViewNoOneWon: View {
    @EnvironmentObject var gameboardDM: GameBoardDataModel
    let myModuleDimension: CGFloat = 300
    var body: some View {
        ZStack {
            Color(.gray)
                .opacity(0.3)
                .ignoresSafeArea()
            //MARK: Module
            VStack {
                HStack{
                    Text("NO ONE WON!!")
                        .fontDesign(.monospaced)
                    Image(systemName: "rainbow")
                }
                Text("Let's Retry ?")
                    .font(.headline)
                    .padding(.top)
                    .onTapGesture {
                        gameboardDM.newGame()
                    }
                
            }
            
            .frame(width: myModuleDimension, height: myModuleDimension)
            .background(.regularMaterial)
            .font(.system(size: 30, weight: .bold))
            .cornerRadius(40)
            
        }
    }
}





#Preview {
    GameResultView()
}






















