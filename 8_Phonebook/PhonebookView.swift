//
//  ContentView.swift
//  8_Phonebook
//
//  Created by Alun King on 24/02/2023.
//

import SwiftUI

struct PhonebookView: View {
    @State var showView = false
    @StateObject private var data = Contacts()
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
                    ContactAddView(contactList:data)
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
