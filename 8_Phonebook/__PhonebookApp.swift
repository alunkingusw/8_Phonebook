//
//  __PhonebookApp.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

@main
struct __PhonebookApp: App {
    //create data store for the app
    @StateObject private var data = Contacts()
    var body: some Scene {
        WindowGroup {
            //create parent view and pass data
            PhonebookView(data:self.data){
                //write saveAction, triggered when the app goes into inactive mode.
                Contacts.save(contacts: data.contacts) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
            //when the app is loaded, the load code should run to display the contacts last saved.
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
