//
//  ContentView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct PhonebookView: View {
    @State var showView = false
    @StateObject var data = Contacts()
    var body: some View {
        NavigationView{
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
                    ContactDetailView(contact:Contact(name:"Example", number:"Example"))
                }
            }
        }
    }
}

struct PhonebookView_Previews: PreviewProvider {
    static var previews: some View {
        PhonebookView()
    }
}
