//
//  ContactDetailView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct ContactDetailView: View {
    @StateObject var contact:Contact
    @Environment(\.dismiss) private var dismiss
    
    
    
    

    var body: some View {
        VStack{
            TextField("Name", text: $contact.editName)
            TextField("Number", text: $contact.editNumber)
        }.padding(2.0)
        .navigationBarItems(trailing:Button("Save"){
            contact.name = contact.editName
            contact.number = contact.editNumber
            //clear cache and dispose view
            dismiss()
        })
        .onDisappear(perform:{
                contact.editName = contact.name
                contact.editNumber = contact.number
        })
    }
}

