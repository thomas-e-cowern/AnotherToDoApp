//
//  SettingsView.swift
//  AnotherToDoApp
//
//  Created by Thomas Cowern New on 2/18/22.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK:  Properties
    
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 0) {
                Form {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                } // MARK:  End of form
                .listStyle(.grouped)
                .environment(\.horizontalSizeClass, .regular)
                // MARK:  Footer
                Text("Copyright 😎 All Rights Reserved. \nProfessional Apps Creative Apps")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
                    
            } // End of VStack
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground")).edgesIgnoringSafeArea(.all)
        } // MARK:  End of navigation
    }
}

// MARK:  Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
