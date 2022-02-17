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

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)],
        animation: .default)
    private var todos: FetchedResults<Todo>

    // MARK:  Body
    var body: some View {
        NavigationView {
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
            Text("Select an item")
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
