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
        VStack (alignment: .center, spacing: 20) {
            Text("Use Your Time Wisely")
        }
    }
}

// MARK:  Preview
struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
