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
        
        TextField(name, text: $name)
            .font(.largeTitle)
            .fontWeight(.medium)
            .padding()
            
        
                    HStack {
                Text("Date Created: \(date.description)")
                    .font(.callout)
            }
                
            TextEditor(text: $what)
            Button {
                sheet = false
            } label: {
                Text("Confirm Creation")
            }
            Spacer()
        
    }
    }


struct NoteAdd_Previews: PreviewProvider {
    static var previews: some View {
        NoteAdd(name: .constant(""), what: .constant(""), date: .constant(Date()), sheet: .constant(false))
    }
}
