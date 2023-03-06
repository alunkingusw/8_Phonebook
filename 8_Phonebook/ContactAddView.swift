//
//  ContactAddView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct ContactAddView: View {
    //We import this from the main view so it is an @ObservedObject
    @ObservedObject var contactList:Contacts
    
    //Create a bank contact for the new contact page should it be called up
    @StateObject var newContact = Contact(name:"", number:"")
    
    //this environment variable is used to dismiss the new contact page
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            
            HStack {
                //these buttons aare positioned at the top for save and cancel
                Button(action: {
                    //simply dismiss the view
                    dismiss()
                }) {
                    Text("Cancel")
                        .padding(6.0)
                }
                Spacer()
                
                Button(action: {
                    //add contact then dismiss the view
                    //do some validation here if needed
                    newContact.editName = newContact.name
                    newContact.editNumber = newContact.number
                    contactList.contacts.append(newContact)
                    dismiss()
                }) {
                    Text("Save")
                        .padding(6.0)
                }
                
                
            } //End HStack
            Spacer()
            TextField("Name: ", text: $newContact.name)
            TextField("Number: ", text: $newContact.number)
            Spacer()
        }.padding(2.0)
        
    }
}

struct ContactAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContactAddView(contactList: Contacts())
    }
}
