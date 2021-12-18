//
//  NoItemsView.swift
//  TodoList
//
//  Created by Pavan Mikkilineni on 17/12/21.
//

import SwiftUI

struct NoItemsView: View {
    
    @State private var animate:Bool=false
    private var secondaryAccentColor:Color=Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing:10){
                Text("There are no Todos!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you aproductive person? I think you should check the add button and add a bunch of items to your todo list!")
                    .padding(.bottom,20)
                NavigationLink(
                    destination: AddTodoView(),
                    label: {
                        Text("Add Something")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth:.infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    })
                    .padding(.horizontal,animate ? 30 : 50)
                    .shadow(
                        color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30
                    )
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline:.now()+1.5){
            withAnimation(Animation.easeInOut(duration: 2.0)
                            .repeatForever()){
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
           NoItemsView()
        }
    }
}
