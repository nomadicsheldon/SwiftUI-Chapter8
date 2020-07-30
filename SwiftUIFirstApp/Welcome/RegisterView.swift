//
//  RegisterView.swift
//  SwiftUIApp(chapter6)
//
//  Created by Himanshu Rajput on 24/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import SwiftUI

struct CustomTextStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        return configuration
        //            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        //            .background(Color.white)
        //            .overlay(RoundedRectangle(cornerRadius: 8)
        //                .stroke(lineWidth: 2)
        //                .foregroundColor(.blue))
        //            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
    }
}

struct RegisterView: View {
    @ObservedObject var keyboardHandler: KeyboardFollower
    //    @State var name: String = ""
    @EnvironmentObject var userManager: UserManager
    
    init(keyboardHandler: KeyboardFollower) {
        print("initializing")
        self.keyboardHandler = keyboardHandler
    }
    
    var body: some View {
        VStack {
            Spacer() // 1st spacer to add
            WelcomeMessageView()
            //            TextField("Type your name...", text: $name) //prefix the property with $ to pass the binding instead of the property value.
            
            
            
            //            ModifiedContent(content: TextField("Type your name...", text: $name), modifier: BorderedViewModifier())
            
            //            TextField("Type your name...", text: $name)
            TextField("Type your name...", text: $userManager.profile.name)
                .bordered()
            //                .textFieldStyle(CustomTextStyle())
            HStack {
                // 1
                Spacer()
                //2
                Text("\(userManager.profile.name.count)")
                    .font(.caption)
                // 3
                    .foregroundColor(userManager.isUserNameValid() ? .green : .red)
                    .padding(.trailing)
            }
            // 4
                .padding(.bottom)
            
            HStack {
                // 1
                Spacer()
                
                // 2
                Toggle(isOn: $userManager.settings.rememberUser) {
                    // 3
                    Text("Remember me")
                        // 4
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                // 5
                .fixedSize()
            }
            
            Button(action: registerUser) {
                // 1
                HStack {
                    // 2
                    Image(systemName: "checkmark")
                        .resizable()
                        // 3
                        .frame(width: 16, height: 16, alignment: .center)
                    Text("Ok")
                        // 4
                        .font(.body)
                        .bold()
                }
            }
                // 5
                .bordered()
                .disabled(!userManager.isUserNameValid())
            Spacer() // 2nd spacer to add
        }
        .padding(.bottom, keyboardHandler.keyboardHeight)
        .edgesIgnoringSafeArea(keyboardHandler.isVisible ? .bottom : [])
        .padding()
        .background(WelcomeBackgroundImage())
    }
}

extension RegisterView {
    func registerUser() {
        // 1
        if userManager.settings.rememberUser {
            // 2
            userManager.persistProfile()
        } else {
            // 3
            userManager.clear()
        }
        
        // 4
        userManager.persistSettings()
        userManager.setRegistered()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static let user = UserManager(name: "Himanshu")
    static var previews: some View {
        RegisterView(keyboardHandler: KeyboardFollower())
            .environmentObject(user)
    }
}
