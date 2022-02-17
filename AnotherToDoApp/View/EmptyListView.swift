//
//  EmptyListView.swift
//  AnotherToDoApp
//
//  Created by Thomas Cowern New on 2/17/22.
//

import SwiftUI

struct EmptyListView: View {
    
    // MARK:  Properties
    
    
    
    
    // MARK:  Body
    var body: some View {
        ZStack {
            VStack (alignment: .center, spacing: 20) {
                
                Image("illustration-no1")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                Text("Use Your Time Wisely")
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
            } // End of VStack
        } // End of ZStack
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK:  Preview
struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
