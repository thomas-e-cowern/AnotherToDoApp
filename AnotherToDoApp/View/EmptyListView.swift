//
//  EmptyListView.swift
//  AnotherToDoApp
//
//  Created by Thomas Cowern New on 2/17/22.
//

import SwiftUI

struct EmptyListView: View {
    
    // MARK:  Properties
    @State private var isAnimated: Bool = false
    
    let images: [String]  = ["illustration-no1", "illustration-no2", "illustration-no3"]
    
    let tips: [String] = ["Use your time wisely", "Keep it short and sweet", "Small is better", "Break it up in bite size pieces", "Don't overdue it", "Take a break when you need it", "Plan ahead to reduce stress"]
    
    // MARK:  Body
    var body: some View {
        ZStack {
            VStack (alignment: .center, spacing: 20) {
                
                Image("\(images.randomElement() ?? self.images[0])")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                Text("\(tips.randomElement() ?? self.tips[0])")
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
            } // End of VStack
            .padding(.horizontal)
            .opacity(isAnimated ? 1 : 0)
            .offset(y: isAnimated ? 0 : -50)
            .animation(.easeOut(duration: 1.5), value: isAnimated)
            .onAppear {
                self.isAnimated.toggle()
            }
            
        } // End of ZStack
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK:  Preview
struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
            .environment(\.colorScheme, .dark)
    }
}
