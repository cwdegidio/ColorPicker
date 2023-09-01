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
            title
            colorVisualizer
            sliderStack
            setButton
        }
        .padding()
    }
    
    var title: some View {
        Text("Color Picker")
            .font(.largeTitle)
    }
    
    var colorVisualizer: some View {
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
                    red: redSliderValue,
                    green: greenSliderValue,
                    blue: blueSliderValue
                )
            }
    }
    
    var setButton: some View {
        Button(action: {
            updateVisualizerValues(
                red: redSliderValue,
                green: greenSliderValue,
                blue: blueSliderValue
            )
        }, label: {
            Text("Set Color")
        })
    }
    
    var sliderStack: some View {
        VStack {
            colorSliderGenerator(
                forColor: "Red",
                value: redSliderValue,
                sliderValue: $redSliderValue
            )
            colorSliderGenerator(
                forColor: "Green",
                value: greenSliderValue,
                sliderValue: $greenSliderValue
            )
            colorSliderGenerator(
                forColor: "Blue",
                value: blueSliderValue,
                sliderValue: $blueSliderValue
            )
        }
    }
    
    /**
    Creates a single Color Slider consisting of a label, a slider, and output of the current value encapsulated in a VStack.

    - Parameters:
        - forColor: A String that is used to label the slider
        - value: A Double that is the current color value from 1.0 to 255.0
        - sliderValue: A Bound Double that tracks the current slider value

    - Returns: some View
     */
    func colorSliderGenerator(forColor label: String, value: Double, sliderValue: Binding<Double>) -> some View {
        VStack {
            Text("\(label)")
            HStack {
                let roundedRedValue = Int(value.rounded())
                Slider(value: sliderValue, in: 1.0...255.0)
                Text("\(roundedRedValue)")
            }
        }
    }
    
    
    
    /**
    Updates a dictionary that is used to store values for "red", "green", and "blue" that is used by the Color Visualizer.

    - Parameters:
        - red: A Double between 1.0 and 255.0 that indicates the level of red to pass to Color()
        - green: A Double between 1.0 and 255.0 that indicates the level of green to pass to Color()
        - blue: A Double between 1.0 and 255.0 that indicates the level of blue to pass to Color()
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
