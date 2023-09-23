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
    // Filtering search results
    private var searchResults: Binding<[note]> {
               if search.isEmpty {
                   return $noteList
               } else {
                   return .constant($noteList.wrappedValue.filter { $0.noteTitle.lowercased().contains(search.description.lowercased()) })
               }
        }

    @State var Sheet: Bool = false
    // Creating the placeholder of note(A default)
    let placeholder = note(noteTitle: "New Note", noteContent: " Content", noteCreated: Date())
    
    // Creating the notelist list and making it persistent
    @Persistent("noteList") var noteList: [note] = []
    
    // defining the remove function for the slide remove feature
    func remove(at offsets: IndexSet) {
        noteList.remove(atOffsets: offsets)
    }
    @State var search: String = ""
    var body: some View {
        // Nesting the navigation stack, List for the notes and VStack for the description of the notes
        
        NavigationStack {
            // Adds the note view to the list for every note in noteList
            List {
                ForEach(searchResults, id: \.self) { note in
                    NavigationLink {
                        NoteView(name: note.noteTitle, what: note.noteContent , date: note.noteCreated)
                    } label: {
                        // The Label is the noteTitle and the Date of creation
                        VStack(alignment: .leading) {
                            
                            
                            Text(note.noteTitle.wrappedValue)
                                .font(.title)
                                .fontWeight(.medium)
                            Text("\(note.noteCreated.wrappedValue)")
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
        // Search function
        .searchable(text: $search, prompt: "Search for a note!")
        // The sheet for the add note page(It is pretty much a copy of view notes)
        .sheet(isPresented: $Sheet) {
            NoteAdd(
                name: $noteList[noteList.count-1].noteTitle ,
                what: $noteList[noteList.count-1 ].noteContent,
                date: $noteList[noteList.count-1 ].noteCreated,
                sheet: $Sheet
            )
        }
   
            
        }
    }
struct NotesMain_Previews: PreviewProvider {
    static var previews: some View {
        NotesMain()
    }
}
