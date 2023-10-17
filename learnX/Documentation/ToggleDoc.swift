//
//  ToggleDoc.swift
//  learnX
//
//  Created by Avyan Mehra on 25/9/23.
//

import SwiftUI

struct ToggleDoc: View {
    @State var toggleExample: Bool = false
    var toggleResult: String = ""
    var body: some View {
        VStack {
            ScrollView {
                Text("Toggles")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                Text("A toggle is basically a switch to turn things on and off. It is used in most true-false situations and is quite easy to implement. You will need a bindng boolean for this.")
                    .font(.title2)
                    .padding()
                Text("Implementing Toggles")
                    .font(.largeTitle)
                    .padding()
                    .fontWeight(.heavy)
                Text("Toggle(\"<Text for the toggle>\", isOn: <binding boolean>)")
                    .font(.body)
                    .lineLimit(nil)
                    .lineSpacing(5)
                Text("Example")
                    .padding()
                    .font( .largeTitle)
                    .fontWeight(.heavy)
                HStack {
                    Spacer(minLength: 10)
                    Toggle("Toggle example:", isOn: $toggleExample)
                Spacer(minLength: 10)
                }
                Text("TOGGLE ME!")
                    .font(.caption)
                    if (toggleExample == true) {
                    Text(" The toggle is on")
                            .font(.title2)
                            .padding()
                } else if (toggleExample == false) {
                    Text( "The toggle is not on")
                        .font(.title2)
                        .padding()

                }
            }
        }
    }
    
}


struct ToggleDoc_Previews: PreviewProvider {
    static var previews: some View {
        ToggleDoc()
    }
}
