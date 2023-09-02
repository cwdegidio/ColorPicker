//
//  ContentView.swift
//  ColorPicker
//
//  Created by Curtis DeGidio on 8/31/23.
//

import SwiftUI

struct ContentView: View {
    private let startingColorSliderValue = 255.0 / 2.0
    @State private var redSliderValue: Double = 255.0 / 2.0
    @State private var greenSliderValue: Double = 255.0 / 2.0
    @State private var blueSliderValue: Double = 255.0 / 2.0
    
    init() {
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
            .fill(Color(red: redSliderValue / 255.0, green: greenSliderValue / 255.0, blue: blueSliderValue / 255.0))
    }
    
    var setButton: some View {
        Button(action: {}, label: {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
