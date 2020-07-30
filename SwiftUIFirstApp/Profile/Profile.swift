//
//  Profile.swift
//  SwiftUIFirstApp
//
//  Created by Himanshu Rajput on 26/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

struct Profile : Codable {
  /// (Selected) name) of the learner.
  var name: String
  
  /// Initializes a new `Profile` with an empty `name`.
  init() {
    self.name = ""
  }
  
  /// Initializes a new `Profile` with a specified name.
  ///  - Parameters:
  ///     - name Name of the user profile.
  init(named name: String) {
    self.name = name
  }
}
