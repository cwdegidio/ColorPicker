//
//  ContentView.swift
//  ColorPicker
//
//  Created by Curtis DeGidio on 8/31/23.
//

import SwiftUI

struct ContentView: View {
    private let maxValue = 255.0
    private let startingColorSliderValue: Double
    @State private var redSliderValue: Double
    @State private var greenSliderValue: Double
    @State private var blueSliderValue: Double
    @State private var visualizerValue = ["red": 0.0, "green": 0.0, "blue": 0.0]
    
    init() {
        self.startingColorSliderValue = maxValue / 2.0
        self.redSliderValue = startingColorSliderValue
        self.greenSliderValue = startingColorSliderValue
        self.blueSliderValue = startingColorSliderValue
    }
    
    var body: some View {
        VStack {
            TitleView()
            ColorVisualizer(
                maxValue: maxValue,
                updateVisualizerValues: updateVisualizerValues(red:green:blue:),
                redSliderValue: $redSliderValue,
                greenSliderValue: $greenSliderValue,
                blueSliderValue: $blueSliderValue,
                visualizerValue: $visualizerValue
            )
            VStack {
                SliderView(color: "Red", value: $redSliderValue)
                SliderView(color: "Blue", value: $blueSliderValue)
                SliderView(color: "Green", value: $greenSliderValue)
            }
            SetButton(
                updateVisualizerValues: updateVisualizerValues(red:green:blue:),
                buttonLabel: "Set Color",
                redSliderValue: $redSliderValue,
                greenSliderValue: $greenSliderValue,
                blueSliderValue: $blueSliderValue)
        }
        .padding()
    }
        
    /**
     Updates a dictionary that is used to store values for "red", "green", and "blue" that is used by the Color Visualizer.
     
     - Parameters:
     - red: A Double between 1.0 and 255.0 that indicates the level of red to pass to Color()
     - green:  A Double between 1.0 and 255.0 that indicates the level of green to pass to Color()
     - blue:  A Double between 1.0 and 255.0 that indicates the level of blue to pass to Color()
     */
    func updateVisualizerValues(red: Double, green: Double, blue: Double) {
        visualizerValue.updateValue(red, forKey: "red")
        visualizerValue.updateValue(green, forKey: "green")
        visualizerValue.updateValue(blue, forKey: "blue")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
