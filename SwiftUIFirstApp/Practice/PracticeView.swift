//
//  PracticeView.swift
//  SwiftUIFirstApp
//
//  Created by Himanshu Rajput on 27/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
    @Binding var challengeTest: ChallengeTest?
    @Binding var userName: String
    
    @ViewBuilder
    var body: some View {
        if challengeTest != nil {
            ChallengeView(challengeTest: challengeTest!)
        } else {
          CongratulationsView(userName: userName)
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static let challengeTest = ChallengeTest(
      challenge: Challenge(question: "おねがい　します", pronunciation: "Onegai shimasu", answer: "Please"),
      answers: ["Thank you", "Hello", "Goodbye"]
    )
    
    static var previews: some View {
        PracticeView(challengeTest: .constant(challengeTest), userName: .constant("Aman"))
    }
}
