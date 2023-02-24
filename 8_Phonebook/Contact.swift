//
//  Contact.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import Foundation
class Contact:Identifiable, ObservableObject{
    @Published var name:String
    @Published var number:String
    let id = UUID()
    
    init (name:String, number:String){
        self.name = name
        self.number = number
    }
}
