//
//  ContentView.swift
//  Rock paper scisors
//
//  Created by Godwin IE on 22/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userSelection = ""
    @State private var aiSelection = ""
    @State private var result = ""
    @State private var score = 0
    @State private var attempts = 0
    
    let userOptions = ["🪨", "📄", "✂️"]
    let aiOptions = ["🪨", "📄", "✂️"]
    
    var textColor: Color {
          if userSelection == aiSelection {
              return .gray
          } else if (userSelection == "🪨" && aiSelection == "✂️") ||
                    (userSelection == "📄" && aiSelection == "🪨") ||
                    (userSelection == "✂️" && aiSelection == "📄") {
              return .green
          } else {
              return .red
          }
      }
    
    var body: some View {
        
        VStack {
            VStack{
                Text("ROCK")
                Text("PAPER")
                Spacer().frame(height: 8)
                Image(systemName: "gamecontroller")
                    .font(.system(size: 30))
            } .foregroundColor(.gray)
            // LOGO

            Spacer()
            Spacer()
            
            
            HStack {
                Spacer()

                VStack {
                    Text(userSelection == "" ? "?" : userSelection)
                        .font(.largeTitle)
                    
                    Spacer().frame(height: 14)
                    
                    Text("You")
                        .font(.title3)
                } //You
                
                Spacer()

                Text("-")
                
                Spacer()
                
                VStack {
                    Text(aiSelection == "" ? "?" : aiSelection)
                        .font(.largeTitle)
                    
                    Spacer().frame(height: 14)
                    
                    Text("Ai")
                        .font(.title3)
                } //ai
                
                Spacer()

            } //Hstack You vs Ai
            
            Group {
                Spacer()
                
                Text(result.isEmpty ? "Select an option" : result)                .foregroundColor(textColor)
                
                Spacer().frame(height: 20)
                
                VStack {
                    Text("Score: \(score)")
                    Spacer().frame(height: 4)
                    Text("Attempts: \(attempts)")
                }
                .frame(width: 250, height: 100)
                .background(.gray.opacity(0.1))
                .cornerRadius(16)
                
                Spacer()
                
                HStack (spacing: 28) {
                    ForEach (0..<3) { option in
                        Button {
                            userSelection = userOptions[option]
                            attempts += 1
                            playGame()
                        } label: {
                            optionView(option: userOptions[option])
                        }
                    }
                } //Hstack for player options
                                
                
            } //GROUP 2
        }
        .padding()
        //parent vstack

    }
    
    
    //play game function
    private func playGame() {
         aiSelection = aiOptions.randomElement() ?? ""
         
         if userSelection == aiSelection {
             result = "It's a tie!"
         } else if (userSelection == "🪨" && aiSelection == "✂️") ||
                   (userSelection == "📄" && aiSelection == "🪨") ||
                   (userSelection == "✂️" && aiSelection == "📄") {
             result = "You win!"
             score += 1
         } else {
             result = "AI wins!"
         }
     }
}


//view for options
struct optionView : View {
    var option : String
    var body: some View {
        Text(option)
            .font(.largeTitle)
            .padding(14)
            .frame(width: 65, height: 65)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
