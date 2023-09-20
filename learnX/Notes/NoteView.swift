//
//  NoteView.swift
//  learnX
//
//  Created by Avyan Mehra on 20/9/23.
//

import SwiftUI

struct NoteView: View {
    @Binding var name: String
    @Binding var what: String
    @Binding var date: Date
  
    
    var body: some View {
        // Heading
        Text("Note Editor")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
        // Note Title
        TextField(name, text: $name)
            .font(.largeTitle)
            .fontWeight(.medium)
            .padding(.leading)
         // When the note was made
             HStack {
                 Text("Date Created: \(date.description)")
                     .font(.callout)
             }
             
                 
                 
             
            // The main note editor
             TextEditor(text: $what)
                
             Spacer()
        
    }
}


struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(name: .constant(""), what: .constant(""), date: .constant(Date()))
    }
}
