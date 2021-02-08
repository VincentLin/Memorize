//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Vincent Lin on 2021/1/5.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.theme.name).bold()
            Text("Score: \(viewModel.score)")
            Grid(items: viewModel.cards) { card in
                    CardView(card: card)
                        //Task 3
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(5)
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.75)) {
                                viewModel.choose(card: card)
                            }
                    }
                }
            .padding()
            .foregroundColor(viewModel.theme.color)
            
            Button() {
                withAnimation(.easeInOut) {
                    self.viewModel.resetGame()
                }
                
            } label: {
                Text("Start A New Game").bold()
            }
            Spacer(minLength: 20.0)
            Text("Keep Calm 😌 & Eat OLLA 🥗").foregroundColor(.gray)

        }
        
        }
            
            // Task 5
            //.font((viewModel.cards.count > 8) ? Font.title3 : Font.largeTitle)
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    var body: some View{
        GeometryReader { geometry in
            if card.isFaceUp || !card.isMatched{
                ZStack {
                    Group{
                        if card.isConsumingBonusTime {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                                .onAppear {
                                    startBonusTimeAnimation()
                                }
                        } else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                        }
                    }.padding(5).opacity(0.4)
                    .transition(.scale)
                    
                    Text(card.content)
                    .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
            }
                
                
        }
            
            
    }
        
    
    
    // MARK: - Drawing Constants

    let fontScaleFactor: CGFloat = 0.75
    
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}

