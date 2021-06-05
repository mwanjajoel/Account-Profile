//
//  ContentView.swift
//  Shared
//
//  Created by Mwanja Joel on 05/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var location = ""
    @State private var birthDate = Date()
    @State private var shouldReceiveNotifications = false
    @State private var darkMode = false
    @State private var numberOfNewsletters = 1

    var body: some View {
        NavigationView {
            
            Form {
                
                Section(header: Text("Personal Information") ) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Location", text: $location)
                    DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
                }
                
                Section(header: Text("Preferences")) {
                    Toggle("Receive Notifications", isOn: $shouldReceiveNotifications)
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                    Toggle("Dark Mode", isOn: $darkMode)
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                    Stepper("Newsletters per week", value: $numberOfNewsletters, in: 1...10)
                    Text("You shall receive \(numberOfNewsletters) newsletters every week")
                    Link("Send Feedback", destination: URL(string: "https://a23labs.com")!)
                    
                }
                
                Section(header: Text("Legal")) {
                    Link("About Us", destination: URL(string: "https://a23labs.com")!)
                    Link("Terms of Service", destination: URL(string: "https://a23labs.com")!)
                    Link("Priacy Policy", destination: URL(string: "https://a23labs.com")!)
                }
                
                
            }
            .navigationTitle("Account") // title of this page
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// this extension helps in dimssing the keyboard
// Read more about it here https://www.hackingwithswift.com/quick-start/swiftui/how-to-dismiss-the-keyboard-for-a-textfield
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
