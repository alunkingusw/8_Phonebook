//
//  __PhonebookApp.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

@main
struct __PhonebookApp: App {
    @StateObject private var data = Contacts()
    var body: some Scene {
        WindowGroup {
            PhonebookView(data:self.data){
                Contacts.save(contacts: data.contacts) { result in
                    print("Saved")
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
            }.onAppear{
                Contacts.load{ result in
                    switch result{
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let contacts):
                        data.contacts = contacts
                    }
                }
            }
        }
    }
}
