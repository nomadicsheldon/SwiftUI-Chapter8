//
//  ChoicesView.swift
//  SwiftUIFirstApp
//
//  Created by Himanshu Rajput on 27/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import SwiftUI

struct ChoicesView: View {
  let challengeTest: ChallengeTest
  @State var challengeSolved = false
  @State var isChallengeResultAlertDisplayed = false
  @ObservedObject var challengesViewModel = ChallengesViewModel()
  
  var body: some View {
    VStack(spacing: 25) {
      ForEach(0 ..< challengeTest.answers.count) { index in
        Button(action: {
          self.challengeSolved = self.checkAnswer(at: index)
          self.isChallengeResultAlertDisplayed = true
        }, label: {
          ChoicesRow(choice: self.challengeTest.answers[index])
        }).alert(isPresented: self.$isChallengeResultAlertDisplayed, content: {
          self.challengeOutcomeAlert()
        })
        Divider()
      }
    }
  }
  
  func challengeOutcomeAlert() -> Alert {
    let alert: Alert
    
    if challengeSolved {
      let dismissButton = Alert.Button.default(Text("OK")) {
        self.isChallengeResultAlertDisplayed = false
        self.challengesViewModel.generateRandomChallenge()
      }
      
      alert = Alert(
        title: Text("Congratulations"),
        message: Text("The answer is correct"),
        dismissButton: dismissButton
      )
    } else {
      let dismissButton = Alert.Button.default(Text("OK")) {
        self.isChallengeResultAlertDisplayed = false
      }
      
      alert = Alert(
        title: Text("Oh no!"),
        message: Text("Your answer is not correct!"),
        dismissButton: dismissButton
      )
    }
    
    return alert
  }
  
  func checkAnswer(at index: Int) -> Bool {
    let answer = self.challengeTest.answers[index]
    let challengeSolved: Bool
    
    if challengeTest.isAnswerCorrect(answer) {
      challengeSolved = true
      challengesViewModel.saveCorrectAnswer(for: self.challengeTest.challenge)
    } else {
      challengeSolved = false
      challengesViewModel.saveWrongAnswer(for: self.challengeTest.challenge)
    }
    
    isChallengeResultAlertDisplayed = true
    return challengeSolved
  }
}

struct ChoicesView_Previews: PreviewProvider {
  static let challengesViewModel = ChallengesViewModel()
  
  static var previews: some View {
    challengesViewModel.generateRandomChallenge()
    return ChoicesView(challengeTest: challengesViewModel.currentChallenge!)
  }
}
