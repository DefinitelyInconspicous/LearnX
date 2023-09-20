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
        
         NavigationStack{
             HStack {
                 Text("Date Created: \(date.description)")
                     .font(.callout)
             }
             
                 TextField(name, text: $name)
                     .font(.largeTitle)
                     .padding()
                 
             
                
             TextEditor(text: $what)
             Spacer()
             
             
             .navigationTitle("Note Creator")
             .navigationBarTitleDisplayMode(.large)
         }
         
    }
}


struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(name: .constant(""), what: .constant(""), date: .constant(Date()))
    }
}
