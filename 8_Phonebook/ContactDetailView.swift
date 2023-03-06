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
            //note the bindings apply to the edit field here, not the original name and number
            TextField("Name", text: $contact.editName)
            TextField("Number", text: $contact.editNumber)
        }.padding(2.0)
        //save button simply copies the edited fields to the original record
        .navigationBarItems(trailing:Button("Save"){
            contact.name = contact.editName
            contact.number = contact.editNumber
            //clear cache and dispose view
            dismiss()
        })
        .onDisappear(perform:{
            //copy the originals back - if they clicked save, this code is meaningless anyway.
            contact.editName = contact.name
            contact.editNumber = contact.number
        })
    }
}

