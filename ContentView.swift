//
//  ContentView.swift
//  war-challenge
//
//  Created by Salma Aly on 7/23/21.
//

import SwiftUI

struct ContentView: View {
    
    @State public var playerCard = "back"
    @State public var cpuCard = "back"
    @State public var playerScore = 0
    @State public var cpuScore = 0
    @State public var playerWin = false
    @State public var cpuWin = false
    
    func checkScore(){
        if (playerScore > cpuScore) && (playerScore > 49){
            playerWin = true
        }
        else if (playerScore < cpuScore) && (cpuScore > 49){
            cpuWin = true
        }
    }
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    if (playerWin && cpuWin) == false{
                        let playerRand = Int.random(in: 2...14)
                        let cpuRand = Int.random(in: 2...14)
                        
                        playerCard = "card" + String(playerRand)
                        cpuCard = "card" + String(cpuRand)
                        
                            if playerRand > cpuRand{
                                playerScore += 1
                            }
                            else if playerRand < cpuRand{
                                cpuScore += 1
                            }
                        checkScore()
                    }
                    
                }, label: {
                    Image("dealbutton")
                })
                Spacer()
                HStack(){
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.title2)
                            .padding(.bottom)
                        Text(String (playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.title2)
                            .padding(.bottom, 10.0)
                        Text(String (cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                        
                }
                .padding()
                .foregroundColor(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
