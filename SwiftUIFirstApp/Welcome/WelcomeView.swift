//
//  WelcomeView.swift
//  SwiftUIApp(chapter6)
//
//  Created by Himanshu Rajput on 24/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var userManager: UserManager
    @ObservedObject var challengesViewModel = ChallengesViewModel()
    @State var showPractice = false
    
    // 1
    @ViewBuilder
    var body: some View {
        if showPractice {
            // 2
            PracticeView(challengeTest: $challengesViewModel.currentChallenge, userName: $userManager.profile.name)
        } else {
            // 3
            ZStack {
                WelcomeBackgroundImage()
                
                VStack {
                    Text(verbatim: "Hi, \(userManager.profile.name)")
                    WelcomeMessageView()
                    // 4
                    Button(action: {
                        self.showPractice = true
                    }, label: {
                        HStack {
                            Image(systemName: "play")
                            Text(verbatim: "Start")
                        }
                    })
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
        .environmentObject(UserManager())
    }
}

struct WelcomeMessageView: View {
    var body: some View {
        HStack {
            LogoImage()
            VStack {
                Text("Welcome to")
                    .font(.headline)
                    .bold()
                Text("SwiftUI")
                    .font(.largeTitle)
                    .bold()
            }
            .foregroundColor(.red)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
        }
    }
}
