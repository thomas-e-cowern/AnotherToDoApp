//
//  AddToDo.swift
//  AnotherToDoApp
//
//  Created by Thomas Cowern New on 2/17/22.
//

import SwiftUI

struct AddToDoView: View {
    
    // MARK:  Properties
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priortiy: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK:  Todo name
                    TextField("Todo", text: $name)
                    
                    // MARK:  Todo priority
                    Picker("Priority", selection: $priortiy) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    // MARK:  Save button
                    Button {
                        print("Save Button Tapped")
                    } label: {
                        Text("Save")
                    }

                    
                } // MARK:  End of form
                
                Spacer()
            } // End of VStack
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
            )
        } // MARK:  End of navigation
    }
}

// MARK:  Preview
struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView()
    }
}
