//
//  DocumentationMain.swift
//  learnX
//
//  Created by Avyan Mehra on 19/9/23.
//

import SwiftUI

struct DocumentationMain: View {
    @State var search: String
    var body: some View {
        NavigationStack {
            List{
                NavigationLink {
                 slider()
                } label: {
                    Text("Note")
                        .font(.title)
                        .fontWeight(.medium)
                }
                NavigationLink {
                 NotesMain()
                } label: {
                    Text("Slider")
                        .font(.title)
                        .fontWeight(.medium)
                }
                .navigationTitle("Documentation")
                .navigationBarTitleDisplayMode(.large)
                .searchable(text: $search)
            }
        }
    }
}

struct DocumentationMain_Previews: PreviewProvider {
    static var previews: some View {
        DocumentationMain(search: "")
    }
}
