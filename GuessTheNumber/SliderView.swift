//
//  SliderVIew.swift
//  GuessTheNumber
//
//  Created by MAC  on 23.05.2022.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    @Binding var targetValue: Double
    
    var body: some View {
        HStack {
            Text("0")
            
            TransparentSlider(value: $value, targetValue: $targetValue)
            
            Text("100")
        }
    }
}

struct SliderVIew_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(60), targetValue: .constant(50))
    }
}
