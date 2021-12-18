//
//  TodoListApp.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var todoListViewModel:TodoListViewModel=TodoListViewModel()
    
    var body: some Scene {

        WindowGroup {
            NavigationView{
               TodoListView()
            }
            .environmentObject(todoListViewModel)
        }
    }
}
