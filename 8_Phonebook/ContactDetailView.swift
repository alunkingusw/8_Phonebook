//
//  ContactDetailView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI
private var saving=false

struct ContactDetailView: View {
    @StateObject var contact:Contact
    @Binding var name:String
    @Binding var number:String
    @Environment(\.dismiss) private var dismiss
    
    
    
    

    var body: some View {
        VStack{
            TextField("Name", text: $name)
            TextField("Number", text: $number)
        }.padding(2.0)
        .navigationBarItems(trailing:Button("Save"){
            saving=true
            contact.name = name
            contact.number = number
            //clear cache and dispose view?
            dismiss()
        })
        .onDisappear(perform:{
            if (!saving){
                name = contact.name
                number = contact.number
            }
        })
        .onAppear(perform:{
            saving = false
        })
    }
}

