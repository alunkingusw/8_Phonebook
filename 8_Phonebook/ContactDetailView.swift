//
//  ContactDetailView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct ContactDetailView: View {
    @StateObject var contact:Contact

    var body: some View {
        VStack{
            TextField("Name: \(contact.name)", text: $contact.name)
            TextField("Number: \(contact.number)", text: $contact.number)
        }.padding(2.0)
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact:Contact(name:"Example", number:"Example"))
    }
}
