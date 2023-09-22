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
        
//            // I will add the introduction pages here so that ppl will know how to use the app
        
        
        // This Tabview is for toggling between the notes page and the documentation(and the settings)
        TabView {
            // The notes tab
            NotesMain(search: "")
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.clipboard")
                        Text("Notes")
                    }
                }
            // The documentation tab
            DocumentationMain(search: "")
                .tabItem {
                    VStack {
                        Image(systemName: "newspaper")
                        Text("Documentation")
                    }
                }
            SettingsMain()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
