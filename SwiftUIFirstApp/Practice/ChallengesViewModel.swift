//
//  ChallengesViewModel.swift
//  SwiftUIFirstApp
//
//  Created by Himanshu Rajput on 27/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import Foundation

struct Challenge {
  let question: String
  let pronunciation: String
  let answer: String
  var completed: Bool = false
  var succeeded: Bool = false
}

extension Challenge : Hashable {
  func hash(into hasher: inout Hasher) {
    question.hash(into: &hasher)
  }
}

struct ChallengeTest {
  let challenge: Challenge
  let answers: [String]
  func isAnswerCorrect(_ answer: String) -> Bool {
    return challenge.answer == answer
  }
}

class ChallengesViewModel: ObservableObject {
    let challenges: [Challenge] = [
      Challenge(question: "はい", pronunciation: "Hai", answer: "Yes"),
      Challenge(question: "いいえ", pronunciation: "iie", answer: "No"),
      Challenge(question: "おねがい　します", pronunciation: "Onegai shimasu", answer: "Please"),
      Challenge(question: "こんにちわ", pronunciation: "Konnichiwa", answer: "Hello"),
      Challenge(question: "はじめまして", pronunciation: "Hajimemashite", answer: "Nice to meet you"),
      Challenge(question: "もしもし", pronunciation: "Moshi moshi", answer: "Hello"),
      Challenge(question: "すみません", pronunciation: "Sumimasen", answer: "Excuse me"),
      Challenge(question: "ありがとう", pronunciation: "Arigatō", answer: "Thank you"),
      Challenge(question: "ごめんなさい", pronunciation: "Gomennasai", answer: "Sorry")
    ]
    
    var allAnswers: [String] { return challenges.map { $0.answer }}
    var correctAnswers: [Challenge] = []
    var wrongAnswers: [Challenge] = []
    @Published var currentChallenge: ChallengeTest?
    
    init() {
      generateRandomChallenge()
    }
    
    func getRandomAnswers(count: Int, including includedAnswer: String) -> [String] {
      let answers = allAnswers
      
      // If there are not enough answers, return them all
      guard count < answers.count else {
        return answers.shuffled()
      }
     
      var randomAnswers = Set<String>()
      randomAnswers.insert(includedAnswer)
      while randomAnswers.count < count {
        guard let randomAnswer = answers.randomElement() else { continue }
        randomAnswers.insert(randomAnswer)
      }
      
      return Array(randomAnswers).shuffled()
    }
    
    func generateRandomChallenge() {
      if correctAnswers.count < 5 {
        currentChallenge = getRandomChallenge()
      } else {
        currentChallenge = nil
      }
    }
    
    func restart() {
      self.correctAnswers = []
      self.wrongAnswers = []
      generateRandomChallenge()
    }
    
    private func getRandomChallenge() -> ChallengeTest? {
      return getRandomChallenges(count: 1).first
    }
    
    private func getRandomChallenges(count: Int) -> [ChallengeTest] {
      let challenges = self.challenges.filter { $0.completed == false }
      var randomChallenges: Set<Challenge>

      // If there are not enough challenges, return them all

      if challenges.count < count {
        randomChallenges = Set(challenges)
      } else {
        randomChallenges = Set()
        while randomChallenges.count < count {
          guard let randomChallenge = challenges.randomElement() else { continue }
          randomChallenges.insert(randomChallenge)
        }
      }

      let tests = randomChallenges.map({
        ChallengeTest(
          challenge: $0,
          answers: getRandomAnswers(count: 3, including: $0.answer)
        )
      })

      return tests.shuffled()
    }
    
    func saveCorrectAnswer(for challenge: Challenge) {
      correctAnswers.append(challenge)
    }
    
    func saveWrongAnswer(for challenge: Challenge) {
      wrongAnswers.append(challenge)
    }
}
