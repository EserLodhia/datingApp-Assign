//
//  ContentView.swift
//  DatingAppLoginEx
//
//  Created by Eser Lodhia on 02/02/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("username") private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.yellow
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.5))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white.opacity(1))
                VStack {
                    Text("Dating App")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(15)
                        .border(.red,width: CGFloat(wrongUsername)).cornerRadius(5)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(15)
                        .border(.red,width: CGFloat(wrongPassword)).cornerRadius(5)
                    
                    Button("Login") {
                        //Authenticate User
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.yellow).cornerRadius(15)
                    
                    NavigationLink(destination: Text("You are logged in @\(username)").navigationBarBackButtonHidden(true), isActive: $showingLoginScreen) {
                        
                        EmptyView()
                    }
                }
                    
            }
            .navigationBarHidden(true)
        }
        
    }
    
    func authenticateUser(username: String, password: String) {
        if username == "Dating2023" {
            wrongUsername = 0
            if password == "Dating123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
