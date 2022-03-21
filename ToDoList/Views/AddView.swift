//
//  AddView.swift
//  ToDoList
//
//  Created by Ruslan Ishmukhametov on 27.02.2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Добавить новое напоминание", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Сохранить".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.accentColor)
                    .cornerRadius(10)
            
                }

            }
            .padding(14)
        }
        .navigationTitle("Добавить новое напоминание")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsLong() {
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsLong() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Твое новое напоминание слишком короткое, чтобы напоминать тебе об этом"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(ListViewModel())
    }
}
