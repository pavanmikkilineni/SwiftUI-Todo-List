//
//  AddTodoView.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import SwiftUI

struct AddTodoView: View {
    
    @State private var textFieldText:String=""
    
    var body: some View {
        ScrollView{
            VStack{
                TextField(
                    "Add todo",
                    text:$textFieldText
                )
                    .padding()
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                Button(action:{
                    
                },label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .frame(maxWidth:.infinity)
                })
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                .controlSize(.large)
            }
        }
        .padding()
        .navigationBarTitle("Add an Item 🖊")
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
          AddTodoView()
        }
    }
}
