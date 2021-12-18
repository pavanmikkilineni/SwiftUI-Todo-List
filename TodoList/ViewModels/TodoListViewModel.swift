//
//  TodoViewModel.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import Foundation
import UIKit

class TodoListViewModel : ObservableObject{
    
    @Published var todos:[TodoModel] = []{
        didSet{
            saveTodos()
        }
    }
    
    init(){
        getTodos()
    }
    
    func getTodos(){
        
        guard let data = UserDefaults.standard.data(forKey: Constants.TODO_LIST_KEY),
        let savedData = try? JSONDecoder().decode([TodoModel].self, from: data) else{ return }
        
        self.todos=savedData
    }
    
    func add(title:String){
        todos.append(TodoModel(title: title, isCompleted: false))
    }
    
    func delete(indexSet:IndexSet){
        todos.remove(atOffsets: indexSet)
    }
    
    func update(todo:TodoModel){
        if let index = todos.firstIndex(where: {$0.id == todo.id}){
            todos[index]=todo.updateCompleted()
        }
    }
    
    func move(from:IndexSet,to:Int){
        todos.move(fromOffsets: from, toOffset: to)
    }
    
    func saveTodos(){
        if let data = try? JSONEncoder().encode(todos){
            UserDefaults.standard.set(data, forKey: Constants.TODO_LIST_KEY)
        }
    }
    
}
