//
//  NotesMain.swift
//  learnX
//
//  Created by Avyan Mehra on 19/9/23.
//

import SwiftUI
import SwiftPersistence

// Creating the note struct
struct note: Identifiable, Codable, Hashable {
    var noteTitle: String
    var noteContent: String
    var noteCreated: Date
    var id = UUID()

}
struct NotesMain: View {
    @State var Sheet: Bool = false
    // Creating the placeholder of note(A default)
    let placeholder = note(noteTitle: "New Note", noteContent: " Content", noteCreated: Date())
    
    // Creating the notelist list and making it persistent
    @Persistent("noteList") var noteList: [note] = []
    // defining the remove function for the slide remove feature
    func remove(at offsets: IndexSet) {
        noteList.remove(atOffsets: offsets)
    }
    @State var search: String
    var body: some View {
        // Nesting the navigation stack, List for the notes and VStack for the description of the notes
        
        NavigationStack {
            // Adds the note view to the list for every note in noteList
            List {
                ForEach(searchResults, id: \.id) { note in
                    NavigationLink {
                        NoteView(name: .constant(note.noteTitle), what: .constant(note.noteContent) , date: .constant(note.noteCreated))
                    } label: {
                        // The Label is the noteTitle and the Date of creation
                        VStack(alignment: .leading) {
                            Text(note.noteTitle)
                                .font(.title)
                                .fontWeight(.medium)
                            Text("\(note.noteCreated)")
                                .font(.caption2)
                        }
                    }
                }
                .onDelete(perform: remove)
                .onMove { from, to in noteList.move(fromOffsets: from, toOffset: to)
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
            .toolbar {
                EditButton()
            }
            
           
            
        }
        .searchable(text: $search, prompt: "Search for a note!")
        .sheet(isPresented: $Sheet) {
            NoteAdd(
                name: $noteList[noteList.count-1].noteTitle ,
                what: $noteList[noteList.count-1 ].noteContent,
                date: $noteList[noteList.count-1 ].noteCreated,
                sheet: $Sheet
            )
        }
   
            // The sheet for the add note page(It is pretty much a copy of view notes)
            
        }
     private var searchResults: [note] {
           if search.isEmpty {
               return noteList
           } else {
               return noteList.filter { $0.noteTitle.lowercased().contains(search.lowercased()) }
           }
    }
    struct NotesMain_Previews: PreviewProvider {
        static var previews: some View {
            NotesMain( search: "")
        }
    }
}
