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
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Text("Cancel")
                }
                Spacer()
                
                Button(action: {
                    contactList.contacts.append(newContact)
                    dismiss()
                }) {
                    Text("Save")
                }
                .padding()
                
            } //HStack
            TextField("Name: ", text: $newContact.name)
            TextField("Number: ", text: $newContact.number)
        }.padding(2.0)
        
    }
}

struct ContactAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContactAddView(contactList: Contacts())
    }
}
