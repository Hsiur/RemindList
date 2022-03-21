//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Ruslan Ishmukhametov on 27.02.2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("У тебя пока нет напоминаний")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Хочешь повысить свою продуктивность? Тогда тебе нужно добавить новые напоминания в свой список. Lets go")
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView()) {
                    Text("Добавить")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor: Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7): Color.accentColor.opacity(0.7),
                    radius: animate ? 30: 10,
                    x: 0,
                    y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 ) {
            withAnimation(
            Animation
                .easeInOut(duration: 2)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
        
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Напоминания")
        }
.previewInterfaceOrientation(.portrait)
    }
}

