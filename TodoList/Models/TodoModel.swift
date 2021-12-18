//
//  TodoModel.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import SwiftUI

struct TodoModel : Identifiable{
    let id:String = UUID().uuidString
    let title:String
    let isCompleted:Bool
}
