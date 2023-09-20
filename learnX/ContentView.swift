//
//  ContentView.swift
//  learnX
//
//  Created by Avyan Mehra on 19/9/23.
//

import SwiftUI
import SwiftPersistence

struct ContentView: View {
    
    
    
    var body: some View {
        TabView {
            // I will add the introduction pages here so that ppl will know how to use the app
        }
        .tabViewStyle(.page)
        
        // This Tabview is for toggling between the notes page and the documentation(and the settings)
        TabView {
            // The notes tab
            NotesMain()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.clipboard")
                        Text("Notes")
                    }
                }
            // The documentation tab
            DocumentationMain()
                .tabItem {
                    VStack {
                        Image(systemName: "newspaper")
                        Text("Documentation")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
