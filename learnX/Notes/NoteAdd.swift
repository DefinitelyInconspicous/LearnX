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
        VStack {
            // Heading
            Text("Note Editor")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .frame(alignment: .top)
            // Note Title
            HStack {
                Text("Title:")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.leading)
                TextField(name, text: $name)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.trailing)
                    .frame(width: 200)
                    .border(.black)
            }
            // When the note was made
            HStack {
                Text("Date Created: \(date.description)")
                    .font(.callout)
                    .frame(alignment: .center)
                Spacer()
            }
            
            
            
            
            // The main note editor
            TextEditor(text: $what)
                .border(.blue)
                .frame(width: 400, height: 650)
            Spacer()
            
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
}

struct NoteAdd_Previews: PreviewProvider {
    static var previews: some View {
        NoteAdd(name: .constant("New Note"), what: .constant("This is a new note"), date: .constant(Date()), sheet: .constant(false))
    }
}
