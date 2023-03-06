//
//  ContentView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct PhonebookView: View {
    //boolean to manage the newDetails view
    @State var showView = false
    @ObservedObject var data:Contacts
    //this variable is used to listen for when the app becomes inactive
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: ()->Void
    var body: some View {
        NavigationView{
            //loop through all contacts and add them to the list
            List (data.contacts){ contact in
                NavigationLink{
                    ContactDetailView(contact:contact)
                } label:{ContactRowView(contact:contact)
                }
            }
            .navigationTitle("Contacts")
            
            .toolbar{
                Button("+"){
                    showView.toggle()
                }.sheet(isPresented:$showView){
                    ContactAddView(contactList:data)
                }
            }
            
        }
        //this triggers a save when the app becomes inactive
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct PhonebookView_Previews: PreviewProvider {
    static var previews: some View {
        PhonebookView(data:Contacts(), saveAction: {})
    }
}
