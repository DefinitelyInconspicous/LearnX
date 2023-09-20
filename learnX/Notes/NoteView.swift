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
            
            List{
                TextField(name, text: $name)
                    .font(.largeTitle)
                
            
                HStack {
                    Text("Date Created: \(date.description)")
                        .font(.caption)
                }
                HStack {
                    Text("The Note :")
                        .font(.title3)
                    TextField(what, text: $what)
                }
                
            }
            
            
            .navigationTitle("Note Editor")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}


struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(name: .constant(""), what: .constant(""), date: .constant(Date()))
    }
}
