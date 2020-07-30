//
//  ChallengeView.swift
//  SwiftUIFirstApp
//
//  Created by Himanshu Rajput on 27/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import SwiftUI

struct ChallengeView: View {
    let challengeTest: ChallengeTest
    @State var showAnswers = false
    
    var body: some View {
        // 1
        VStack {
            // 2
            Button(action: {self.showAnswers = !self.showAnswers}, label: {
                // 3
                QuestionView(question: challengeTest.challenge.question)
                    .frame(height: 300)
            })
            
            // 4
            if showAnswers {
                Divider()
                // 5
                ChoicesView(challengeTest: challengeTest)
                    .frame(height: 300)
                    .padding()
            }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static let challengeTest = ChallengeTest(challenge: Challenge(question: "おねがい　します", pronunciation: "Onegai shimasu", answer: "Please")
        , answers: ["Thank you, Hello, Goodbye"])
    static var previews: some View {
        return ChallengeView(challengeTest: challengeTest)
    }
}
