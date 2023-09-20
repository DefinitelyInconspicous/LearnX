//
//  NotesMain.swift
//  learnX
//
//  Created by Avyan Mehra on 19/9/23.
//

import SwiftUI
import SwiftPersistence

// Creating the note struct
struct note: Identifiable, Codable {
    var noteTitle: String
    var noteContent: String
    var noteCreated: Date
    var id = UUID()

}
struct NotesMain: View {
    @State var Sheet: Bool = false
    // Creating the placeholder of note(A default)
    let placeholder = note(noteTitle: "New Note", noteContent: " Content", noteCreated: Date())
    
    // Creating the notelist list
     @State var noteList: [note] = []
    var body: some View {
        // Nesting the navigation stack, List for the notes and VStack for the description of the notes
        
        NavigationStack {
            
                List {
                    ForEach($noteList, id: \.id) { note in
                        NavigationLink {
                            NoteView(name: note.noteTitle, what: note.noteContent , date: note.noteCreated)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(note.noteTitle.wrappedValue)
                                    .font(.title)
                                Text(note.noteCreated.wrappedValue.description)
                                    .font(.caption)
                            }
                        }
                    }
                }
            
                // Creating the navigation title and making it large
                .navigationTitle("Notes")
                .navigationBarTitleDisplayMode(.large)
                // adding the add note button to the toolbar
                .toolbar {
                    Button {
                        noteList.append(note(noteTitle: "New Note", noteContent: "", noteCreated: Date()))
                        Sheet = true
                    } label: {
                        Image(systemName: "doc.badge.plus")
                            .tint(.accentColor)
                    }
                }
                
            
            
        }
        .sheet(isPresented: $Sheet) {
            NoteAdd(
                name: $noteList[noteList.count-1].noteTitle ,
                what: $noteList[noteList.count-1 ].noteContent,
                date: $noteList[noteList.count-1 ].noteCreated,
                
                }

        }
    }
    struct NotesMain_Previews: PreviewProvider {
        static var previews: some View {
            NotesMain()
        }
    }

