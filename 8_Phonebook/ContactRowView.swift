//
//  ContactRowView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct ContactRowView: View {
    var contact:Contact

    var body: some View {
        VStack{
            Text("Name: \(contact.name)")
            Text("Number: \(contact.number)")
        }.padding(2.0)
    }
}

struct ContactRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView(contact:Contact(name:"Example", number:"Example"))
    }
}
