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
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(Color.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text).foregroundColor(Color.gray)
            
            Spacer()
            
            Button {
                print("Here we go....")
                guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else {
                    return
                }
                UIApplication.shared.open(url as URL)
                
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
            }
            .accentColor(Color.gray)

            
        }
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
