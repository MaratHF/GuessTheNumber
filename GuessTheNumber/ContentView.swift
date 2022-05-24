//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by MAC  on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var targetValue = Double.random(in: 0...100)
    @State var currentValue: Double = 50
    @State var alertPresented = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвинь слайдер, как можно ближе к: \(lround(targetValue))")
            
            SliderView(value: $currentValue, targetValue: $targetValue)
            
            Button("Проверь меня!", action: { alertPresented.toggle() })
                .alert(
                    "Your score \n \(computeScore())",
                    isPresented: $alertPresented,
                    actions: {}
                )
            
            Button("Начать заново") {
                targetValue = Double.random(in: 0...100)
            }
        }
        .padding([.trailing, .leading])
    }
    
    private func computeScore() -> Int {
        let difference = abs(lround(targetValue - currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(targetValue: 1, currentValue: 1)
    }
}
