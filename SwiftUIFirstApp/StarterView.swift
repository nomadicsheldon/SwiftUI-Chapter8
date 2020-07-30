//
//  StarterView.swift
//  SwiftUIFirstApp
//
//  Created by Himanshu Rajput on 27/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var userViewModel: UserManager
    
    @ViewBuilder
    var body: some View {
        if self.userViewModel.isRegistered {
            WelcomeView()
        } else {
            RegisterView(keyboardHandler: KeyboardFollower())
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
