//
//  Contact.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import Foundation
class Contact:Identifiable, ObservableObject, Codable{
       
    @Published var name:String
    @Published var number:String
    let id = UUID()
    
    init (name:String, number:String){
        self.name = name
        self.number = number
    }
    
    //coding compliance code below
    
    enum CodingKeys: CodingKey {
        case name, number, id
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(number, forKey: .number)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        number = try container.decode(String.self, forKey: .number)
    }
}
