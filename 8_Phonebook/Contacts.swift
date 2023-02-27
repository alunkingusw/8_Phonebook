//
//  Contacts.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import Foundation
class Contacts:ObservableObject{
    @Published var contacts:[Contact] = [
        Contact(name: "Alice", number:"07123456789"),
        Contact(name: "Tamino", number:"07123456789"),
        Contact(name: "Pamina", number:"07123456789"),
    ]
}
