//
//  ContactDetailView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct ContactDetailView: View {
    @StateObject var contact:Contact
    @State var name:String
    @State var number:String
    
    init(contact: Contact) {
        _contact = StateObject(wrappedValue: contact)
        _name = State(initialValue: contact.name)
        _number = State(initialValue: contact.number)
    }
    

    var body: some View {
        VStack{
            TextField("Name", text: $name)
            TextField("Number", text: $number)
        }.padding(2.0)
        .navigationBarItems(trailing:Button("Save"){
            contact.name = name
            contact.number = number
            //clear cache and dispose view?
        })
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact:Contact(name:"Example", number:"Example"))
    }
}
