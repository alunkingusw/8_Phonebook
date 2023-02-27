//
//  ContactAddView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct ContactAddView: View {
    @ObservedObject var contactList:Contacts
    
    @StateObject var newContact = Contact(name:"", number:"")
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Text("Cancel")
                        .padding(6.0)
                }
                Spacer()
                
                Button(action: {
                    ///do some validation here
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
