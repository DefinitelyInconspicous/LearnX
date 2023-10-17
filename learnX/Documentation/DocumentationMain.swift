//
//  DocumentationMain.swift
//  learnX
//
//  Created by Avyan Mehra on 19/9/23.
//

import SwiftUI
// Creating the documentation struct
struct documentation: Identifiable {
//    static func == (lhs: documentation, rhs: documentation) -> Bool {
//           lhs.id == rhs.id
//       }
//       func hash(into hasher: inout Hasher) {
//           hasher.combine(id)
//           hasher.combine(docName)
//       }
    
    var id = UUID()
    var docView: AnyView
    var docName: String
}
struct DocumentationMain: View {
/*
 MARK: - README
 
 when adding your documentation, create a new instance in the list below and type this
 
 documentation(docView: AnyView(<name of view>), docName: "<Name of documentation>"),
 
 you can copy the above template and paste in the corrent information
 remember the comma
 
 */

    @State var documentationList: [documentation] = [
        documentation(docView: AnyView(slider()), docName: "Slider"),
        documentation(docView: AnyView(ToggleDoc()), docName: "Toggle"),
    
    ]
    
    
    
    
    
    @State var search: String = ""
    var body: some View {
        NavigationStack {
            List{
                ForEach($documentationList) { doc in
                    NavigationLink{
                        doc.docView.wrappedValue
                    } label: {
                        Text(doc.docName.wrappedValue)
                            .font(.title)
                            .fontWeight(.medium)
                    }
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
        DocumentationMain()
    }
}
