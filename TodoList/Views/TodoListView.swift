//
//  TodoListView.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import SwiftUI

struct TodoListView: View {
    
    let todos:[String] = [
        "Eat",
        "Sleep",
        "Repeat"
    ]
    
    var body: some View {
        List{
            ForEach(todos,id:\.self){ todo in
                TodoItemView(title: todo)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .toolbar(content: {
            ToolbarItem(placement:.navigationBarLeading){
                EditButton()
            }
            ToolbarItem(placement:.navigationBarTrailing){
                NavigationLink(
                    "Add",
                    destination:AddTodoView()
                )
            }
        })
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
           TodoListView()
        }
    }
}
