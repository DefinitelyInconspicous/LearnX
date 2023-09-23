//
//  SettingsMain.swift
//  learnX
//
//  Created by Avyan Mehra on 22/9/23.
//

import SwiftUI
import SwiftPersistence

struct SettingsMain: View {
    @Persistent("currentAppIcon") var currentAppIcon: String = "App Icon"
    var body: some View {
        VStack{
            HStack {
                Text("Change App Icon:")
                    .font(.headline)
                    .padding()
                Picker("app icons", selection: $currentAppIcon) {
                    @State var appIcons: [String] = ["AppIcon ", "AppIcon 1"]
                    ForEach(appIcons, id: \.self) { icon in
                        Text(icon)
                            .tag(icon)
                    }
                }
                .padding()
                .pickerStyle(.wheel)
                
            }
            Spacer()
        }
        .onChange(of: currentAppIcon) { newValue in
            if currentAppIcon == "New Icon" {
                UIApplication.shared.setAlternateIconName(nil)
            } else {
                UIApplication.shared.setAlternateIconName(newValue)
            }
    }
        
    }
        
       
}
    
    struct SettingsMain_Previews: PreviewProvider {
        static var previews: some View {
            SettingsMain()
        }
    }
    

