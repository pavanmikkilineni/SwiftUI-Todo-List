//
//  TodoModel.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import SwiftUI

struct TodoModel : Identifiable, Codable{
    
    let id:String
    let title:String
    let isCompleted:Bool
    
    init(id:String = UUID().uuidString, title:String, isCompleted:Bool){
        self.id = id
        self.title=title
        self.isCompleted=isCompleted
    }
    
    func updateCompleted() -> TodoModel{
        return TodoModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
