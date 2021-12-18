//
//  TodoItemView.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import SwiftUI

struct TodoItemView: View {
    
    var title:String
    
    var body: some View {
        HStack{
            Image(systemName:"checkmark.circle")
            Text(title)
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(title:"First Todo Item")
    }
}
