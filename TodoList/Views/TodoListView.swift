//
//  TodoListView.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import SwiftUI

struct TodoListView: View {
    
    @EnvironmentObject var todoListViewModel:TodoListViewModel
    
    var body: some View {
        ZStack{
            if todoListViewModel.todos.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else{
                List{
                    ForEach(todoListViewModel.todos){ todo in
                        TodoItemView(todo: todo)
                            .onTapGesture(perform:{
                                updateWithAnimation(todo: todo)
                            })
                    }
                    .onDelete(perform:todoListViewModel.delete)
                    .onMove(perform: todoListViewModel.move)
                    
                }
                .listStyle(PlainListStyle())
                
            }
        }
        .navigationBarTitle("Todo List 📝")
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
    
    func updateWithAnimation(todo:TodoModel){
        withAnimation(.linear){
            todoListViewModel.update(todo: todo)
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
           TodoListView()
        }
    }
}
