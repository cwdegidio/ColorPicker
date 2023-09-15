//
//  SetButton.swift
//  ColorPicker
//
//  Created by Curtis DeGidio on 9/2/23.
//

import SwiftUI

struct SetButton: View {
    var updateVisualizerValues: (Double, Double, Double) -> Void
    var buttonLabel: String
    @Binding var redSliderValue: Double
    @Binding var greenSliderValue: Double
    @Binding var blueSliderValue: Double
    
    var body: some View {
        Button(action: {
            updateVisualizerValues(
                redSliderValue,
                greenSliderValue,
                blueSliderValue
            )
        }, label: {
            Text(buttonLabel)
        })
    }
}

struct SetButton_Previews: PreviewProvider {
    struct Container: View {
        var updateVisualizerValues = updateVisualizerValues(red:green:blue:)
        var buttonLabel = "Set Color"
        @State var visualizerValue = ["red": 128.0, "green": 128.0, "blue": 128.0]
        @State var redSliderValue = 128.0
        @State var greenSliderValue = 128.0
        @State var blueSliderValue = 128.0
        
        var body: some View {
            SetButton(
                updateVisualizerValues: updateVisualizerValues(red:green:blue:),
                buttonLabel: buttonLabel,
                redSliderValue: $redSliderValue,
                greenSliderValue: $greenSliderValue,
                blueSliderValue: $blueSliderValue)
        }
        
        func updateVisualizerValues(red: Double, green: Double, blue: Double) {
            visualizerValue.updateValue(red, forKey: "red")
            visualizerValue.updateValue(green, forKey: "green")
            visualizerValue.updateValue(blue, forKey: "blue")
        }
    }
    
    static var previews: some View {
        Container()
    }
}
