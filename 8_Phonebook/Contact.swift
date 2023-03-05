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
    var editName:String
    var editNumber:String
    let id = UUID()
    
    init (name:String, number:String){
        self.name = name
        self.number = number
        self.editName = name
        self.editNumber = number
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
        let decodedName = try container.decode(String.self, forKey: .name)
        let decodedNumber = try container.decode(String.self, forKey: .number)
        name = decodedName
        number = decodedNumber
        editName = decodedName
        editNumber = decodedNumber
    }
}
