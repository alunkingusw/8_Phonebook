//
//  Contact.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import Foundation
import SwiftUI
class Contact:Identifiable, ObservableObject, Codable{
       
    @Published var name:String
    @Published var number:String
    @Published var image:Image?
    @Published var favourite:Bool
    @Published var dateOfBirth:Date
    var editName:String
    var editNumber:String
    var editFavourite:Bool
    var editDateOfBirth:Date
    @Published var editImage:Image?
    let id = UUID()
    
    init (name:String, number:String, favourite:Bool, dateOfBirth:Date){
        self.name = name
        self.number = number
        self.favourite = favourite
        self.dateOfBirth = dateOfBirth
        
        self.editName = name
        self.editNumber = number
        self.editFavourite = favourite
        self.editDateOfBirth = dateOfBirth
    }
    
    //coding compliance code below
    
    enum CodingKeys: CodingKey {
        case name, number, image, id, favourite, dateOfBirth
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(number, forKey: .number)
        try container.encode(favourite, forKey: .favourite)
        try container.encode(dateOfBirth, forKey: .dateOfBirth)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decodedName = try container.decode(String.self, forKey: .name)
        let decodedNumber = try container.decode(String.self, forKey: .number)
        let decodedFavourite = try container.decode(Bool.self, forKey: .favourite)
        let decodedDateOfBirth = try container.decode(Date.self, forKey: .dateOfBirth)

        name = decodedName
        number = decodedNumber
        editName = decodedName
        editNumber = decodedNumber
        favourite = decodedFavourite
        editFavourite = decodedFavourite
        dateOfBirth = decodedDateOfBirth
        editDateOfBirth = decodedDateOfBirth
    }
}
