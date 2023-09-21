//
//  NoteAdd.swift
//  learnX
//
//  Created by Avyan Mehra on 20/9/23.
//

import SwiftUI

struct NoteAdd: View {
    @Binding var name: String
    @Binding var what: String
    @Binding var date: Date
    @Binding var sheet: Bool
    var body: some View {
        // Creating title text
        Text("Note Creator")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
        
        // Text field for the title editing
        TextField(name, text: $name)
            .font(.largeTitle)
            .fontWeight(.medium)
            .padding()
            
        // Text of when the note was created
                    HStack {
                Text("Date Created: \(date.description)")
                    .font(.callout)
            }
                // The main note text Editor
    
                TextEditor(text: $what)
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                
        
        // The confirm button
            Button {
                sheet = false
            } label: {
                Text("Confirm Creation")
            }
            .buttonBorderShape(.roundedRectangle(radius: 10))
            .buttonStyle(.bordered)
            .tint(.mint)
            
            Spacer()
        
    }
    }


struct NoteAdd_Previews: PreviewProvider {
    static var previews: some View {
        NoteAdd(name: .constant("New Note"), what: .constant("This is a new note"), date: .constant(Date()), sheet: .constant(false))
    }
}
