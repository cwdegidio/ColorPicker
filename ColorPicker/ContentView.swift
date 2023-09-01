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
        Group {
            VStack {
                Text("Red")
                HStack {
                    let roundedRedValue = Int(redSliderValue.rounded())
                    Slider(value: $redSliderValue, in: 1.0...255.0)
                    Text("\(roundedRedValue)")
                }
            }
            VStack {
                Text("Green")
                HStack {
                    let roundedGreenValue = Int(greenSliderValue.rounded())
                    Slider(value: $greenSliderValue, in: 1.0...255.0)
                    Text("\(roundedGreenValue)")
                }
            }
            VStack {
                Text("Blue")
                HStack {
                    let roundedBlueValue = Int(blueSliderValue.rounded())
                    Slider(value: $blueSliderValue, in: 1.0...255.0)
                    Text("\(roundedBlueValue)")
                }
            }
        }
    }
    
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
