//
//  SettingsView.swift
//  AnotherToDoApp
//
//  Created by Thomas Cowern New on 2/18/22.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK:  Properties
    @Environment(\.presentationMode) var presentationMode
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 0) {
                Form {
                    
                    // MARK:  Section 3
                    Section(header: Text("Follow us on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "website", link: "https://swiftuimasterclass.com")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "twitter", link: "https://twitter.com")
                        FormRowLinkView(icon: "play.rectangle", color: Color.yellow, text: "courses", link: "https://www.udemy.com")
                    }
                    
                    // MARK:  Section 4
                    
                    Section(header: Text("About the application")) {
                        
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "To Do")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatability", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Thomas Cowern")
                        FormRowStaticView(icon: "Paintbrush", firstText: "Designer", secondText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    } // MARK:  End of section 4
                    
                    
                    
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
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
            )
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground"))
        } // MARK:  End of navigation
    }
}

// MARK:  Preview
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
