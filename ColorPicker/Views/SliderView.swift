//
//  SliderView.swift
//  ColorPicker
//
//  Created by Curtis DeGidio on 9/2/23.
//

import SwiftUI

struct SliderView: View {
    var color: String
    @Binding var value: Double
    
    var body: some View {
        VStack {
            Text(color)
            HStack {
                let roundedValue = Int(value.rounded())
                Slider(value: $value, in: 1.0...255.0)
                Text(String(roundedValue))
            }
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    struct Container: View {
        @State var value = 128.0
        
        var body: some View {
            SliderView(color: "Red", value: $value)
        }
    }
    
    static var previews: some View {
        Container()
    }
}
