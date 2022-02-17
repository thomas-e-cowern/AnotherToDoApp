//
//  ContentView.swift
//  AnotherToDoApp
//
//  Created by Thomas Cowern New on 2/17/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // MARK:  Properties
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var showAddTodoView: Bool = false
    @State private var animationButton: Bool = false

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)],
        animation: .default)
    private var todos: FetchedResults<Todo>

    // MARK:  Body
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(self.todos, id: \.self) { todo in
                        
                        HStack {
                            Text(todo.name ?? "No name for this todo")
                            
                            Spacer()
                            
                            Text(todo.priority ?? "No priority for this todo")
                        }
                    }
                    .onDelete(perform: deleteItems)
                    .navigationBarTitle("Todo", displayMode: .inline)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: showAddTodo) {
                            Label("Add Item", systemImage: "plus")
                        }
                        .sheet(isPresented: $showAddTodoView) {
                            AddToDoView().environment(\.managedObjectContext, self.viewContext)
                        }
                    }
                }
                if todos.count == 0 {
                    EmptyListView()
                }
            } // End of ZStack
            .sheet(isPresented: $showAddTodoView) {
                AddToDoView().environment(\.managedObjectContext, self.viewContext)
            }
            .overlay(
                ZStack {
                    
                    Group {
                        Circle()
                            .fill(Color.blue)
                            .opacity(self.animationButton ? 0.2 : 0)
                            .scaleEffect(self.animationButton ? 1 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        Circle()
                            .fill(Color.blue)
                            .opacity(self.animationButton ? 0.15 : 0)
                            .scaleEffect(self.animationButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animationButton)
                    
                    Button(action: {
                        self.showAddTodoView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    }) // MARK:  End of button
                        .onAppear {
                            self.animationButton.toggle()
                        }
                } // End of ZStack
                    .padding(.bottom, 15)
                    .padding(.trailing, 15)
                , alignment: .bottomTrailing
            )
        }
    }
    
    private func showAddTodo () {
        self.showAddTodoView.toggle()
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { todos[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
 
                print(error)
                
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK:  Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
