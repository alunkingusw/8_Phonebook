//
//  ContactRowView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct ContactRowView: View {
    @StateObject var contact:Contact

    var body: some View {
        HStack{
            Toggle(isOn: $contact.favourite) {
                Image(systemName: contact.favourite ? "star.fill" : "star")
                        }
                        .tint(.green)
                    }
            VStack{
                Text("Name: \(contact.name)")
                Text("Number: \(contact.number)")
                
            }
        }
        
    
}

struct ContactRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRowView(contact:Contact(name:"Example", number:"Example", favourite: false, dateOfBirth: Date.init()))
    }
}
