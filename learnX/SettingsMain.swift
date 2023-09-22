//
//  SettingsMain.swift
//  learnX
//
//  Created by Avyan Mehra on 22/9/23.
//

import SwiftUI

struct SettingsMain: View {
    var body: some View {
        VStack{
            Text("Change App Icon")
                .font(.largeTitle)

            HStack{
                Button {
                    UIApplication.shared.setAlternateIconName(nil)
                } label: {
                    VStack {
                        Image("newIcon")
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 100, height: 100, alignment: .center)
                        Text("New Icon")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                

                Button {
                    UIApplication.shared.setAlternateIconName("Old")
                } label: {
                    VStack {
                        Image("oldIcon")
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 100, height: 100)
                            
                        Text("Old Icon")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)

                    }
                }
                .padding()
            }
            Spacer()
        }
        
    }
    
}

struct SettingsMain_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMain()
    }
}
