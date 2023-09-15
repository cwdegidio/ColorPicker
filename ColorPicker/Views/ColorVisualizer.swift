//
//  ColorVisualizer.swift
//  ColorPicker
//
//  Created by Curtis DeGidio on 9/2/23.
//

import SwiftUI

struct ColorVisualizer: View {
    var maxValue: Double
    var updateVisualizerValues: (Double, Double, Double) -> Void
    @Binding var redSliderValue: Double
    @Binding var greenSliderValue: Double
    @Binding var blueSliderValue: Double
    @Binding var visualizerValue: [String:Double]
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(
                Color(
                    red: (visualizerValue["red"] ?? 0) / maxValue,
                    green: (visualizerValue["green"] ?? 0) / maxValue,
                    blue: (visualizerValue["blue"] ?? 0) / maxValue
                )
            )
            .onAppear {
                updateVisualizerValues(
                    redSliderValue,
                    greenSliderValue,
                    blueSliderValue
                )
            }
    }
}

struct ColorVisualizer_Previews: PreviewProvider {
    @State static var visualizerValue = ["red": 128.0, "green": 128.0, "blue": 128.0]
    @State static var redSliderValue = 128.0
    @State static var greenSliderValue = 128.0
    @State static var blueSliderValue = 128.0
    
    static var previews: some View {
        
        ColorVisualizer(
            maxValue: 255.0,
            updateVisualizerValues: updateVisualizerValues(red:green:blue:),
            redSliderValue: $redSliderValue,
            greenSliderValue: $greenSliderValue,
            blueSliderValue: $greenSliderValue,
            visualizerValue: $visualizerValue)
    }
    
    static func updateVisualizerValues(red: Double, green: Double, blue: Double) {
        ColorVisualizer_Previews.visualizerValue.updateValue(red, forKey: "red")
        ColorVisualizer_Previews.visualizerValue.updateValue(green, forKey: "green")
        ColorVisualizer_Previews.visualizerValue.updateValue(blue, forKey: "blue")
    }
}
