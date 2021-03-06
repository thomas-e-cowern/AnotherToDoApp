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
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    // MARK:  Body
    var body: some View {
        NavigationView {
            VStack {
                VStack (alignment: .leading, spacing: 20) {
                    // MARK:  Todo name
                    TextField("Todo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    
                    // MARK:  Todo priority
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    // MARK:  Save button
                    Button {
                        
                        if self.name != "" {
                            let todo = Todo(context: self.managedObjectContext)
                            
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do {
                                try self.managedObjectContext.save()
                                print("New todo: \(todo.name ?? "Uh Ohh..."), Priority: \(todo.priority ?? "No priority....")")
                            } catch {
                                print(error)
                            }
                        } else {
                            self.errorShowing = true
                            self.errorTitle = "Invalid Entry"
                            self.errorMessage = "Please enter a valid Todo item"
                            return
                        }
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(9)
                            .foregroundColor(Color.white)
                    }

                    
                } // MARK:  End of VStack
                .padding(.horizontal)
                .padding(.vertical)
                
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
            .alert(isPresented: $errorShowing) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        } // MARK:  End of navigation
    }
}

// MARK:  Preview
struct AddToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoView()
    }
}
