//
//  AddTodoView.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var todoListViewModel:TodoListViewModel
    @State private var textFieldText:String=""
    @State private var showAlert:Bool = false
    
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
                Button(action: saveButtonPressed,
                    label: {
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func isValid() -> Bool{
        if textFieldText.count<3{
            return false
        }
        return true
    }
    
    func saveButtonPressed(){
        if isValid(){
           todoListViewModel.add(title: textFieldText)
           dismiss()
        }
        else{
            showAlert.toggle()
        }
    }
    
    func getAlert() -> Alert{
        return Alert(
            title: Text("Your new todo item must be atleast 3 characters long!!!")
        )
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
          AddTodoView()
        }
    }
}
