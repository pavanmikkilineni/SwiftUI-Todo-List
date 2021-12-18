//
//  TodoItemView.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import SwiftUI

struct TodoItemView: View {
    
    var todo:TodoModel
    
    var body: some View {
        HStack{
            Image(systemName:todo.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isCompleted ? .green : .red)
            Text(todo.title)
            Spacer()
        }
        .font(.title2)
        .padding(12)
    }
}

struct TodoItemView_Previews: PreviewProvider {
    
    static var t1=TodoModel(title: "Eat", isCompleted: false)
    static var t2=TodoModel(title: "Sleep", isCompleted: true)
    
    static var previews: some View {
        
        Group{
          TodoItemView(todo: t1)
          TodoItemView(todo: t2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
