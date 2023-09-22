//
//  slider.swift
//  learnX
//
//  Created by Avyan Mehra on 21/9/23.
//

import SwiftUI
import Foundation

struct slider: View {
    @State private var sliderExample: Double = 0
    var body: some View {
            ScrollView {
                Text("Slider")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                Text("A slider is exactly what it sounds like. It is used to adjust the value of a binding double between a range of values.")
                    .font(.title2)
                    .padding()
                Text("Implementing Sliders")
                    .font(.largeTitle)
                    .padding()
                    .fontWeight(.heavy)
                Text("Slider(value: <BoundVariable>, \n in: <minimum value>...<maximum value>, step: <stepnum>) { \n Text(\"<title>\") \n } minimumValueLabel { \n Text(\"<minimum value> \") \n } maximumValueLabel { \n Text(\"<maximum value>) \n }")
                    .font(.body)
                    .padding()
                    .lineLimit(nil)
                    .lineSpacing(5)
                Text("Example")
                    .font( .largeTitle)
                    .fontWeight(.heavy)
                HStack {
                    Spacer(minLength: 10)
                    Slider(value: $sliderExample, in: 0...100, step: 1) {
                        Text("Slider")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("100")
                    }
                Spacer(minLength: 10)
                }
                Text("SLIDE ME!")
                    .font(.caption)
                Text("This is a slider example. The current value of the slider is \(sliderExample.description)")
                    .font(.title2)
                    .padding()
                
                Text("")
            }
        
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        slider()
    }
}

