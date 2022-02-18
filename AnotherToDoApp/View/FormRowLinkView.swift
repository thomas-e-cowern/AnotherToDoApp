//
//  FormRowLinkView.swift
//  AnotherToDoApp
//
//  Created by Thomas Cowern New on 2/18/22.
//

import SwiftUI

struct FormRowLinkView: View {
    
    // MARK:  Properties
    var icon: String
    var color: Color
    var text: String
    var link: String
    
    // MARK:  Body
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK:  Preview
struct FormRowLinkView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowLinkView(icon: "globe", color: Color.pink, text: "website", link: "https://swiftuimasterclass.com")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
