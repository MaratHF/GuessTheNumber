//
//  SliderView.swift
//  GuessTheNumber
//
//  Created by MAC  on 23.05.2022.
//

import SwiftUI

struct TransparentSlider: UIViewRepresentable {
    @Binding var value: Double
    @Binding var targetValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.changeSliderValue),
                         for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: calculateTransparent())
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    private func calculateTransparent() -> Double {
        
        var transparent = value - targetValue
        
        if transparent < 0 {
            transparent *= -1
        }
        
        if transparent == 0 {
            return 1
        } else if (0...10).contains(transparent) {
            return 0.9
        } else if (10...20).contains(transparent) {
            return 0.8
        } else if (20...30).contains(transparent) {
            return 0.7
        } else if (30...40).contains(transparent) {
            return 0.6
        } else if (40...50).contains(transparent) {
            return 0.5
        } else if (50...60).contains(transparent) {
            return 0.4
        } else if (60...70).contains(transparent) {
            return 0.3
        } else if (70...80).contains(transparent) {
            return 0.2
        } else if (80...90).contains(transparent) {
            return 0.1
        } else if (90...99).contains(transparent) {
            return 0.05
        }
        return 0
    }
}

extension TransparentSlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changeSliderValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        TransparentSlider(value: .constant(60), targetValue: .constant(1))
    }
}
