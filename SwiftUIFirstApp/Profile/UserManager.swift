//
//  UserManager.swift
//  SwiftUIFirstApp
//
//  Created by Himanshu Rajput on 26/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import Foundation

final class UserManager: ObservableObject {
    @Published
    var profile: Profile = Profile()
    
    @Published
    var settings: Settings = Settings()
    
    @Published
    var isRegistered: Bool
    

    init() {
      isRegistered = false
    }
    
    init(name: String) {
      isRegistered = name.isEmpty == false
      self.profile.name = name
    }
    
    func setRegistered() {
      isRegistered = profile.name.isEmpty == false
    }
    
    // Why?
    func persistProfile() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(profile), forKey: "user-profile")
    }
    
    // Why?
    func persistSettings() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(settings), forKey: "user-settings")
    }
    
    func load() {
        if let data = UserDefaults.standard.value(forKey: "user-profile") as? Data {
            if let profile = try? PropertyListDecoder().decode(Profile.self, from: data) {
              self.profile = profile
            }
        }
        
        if let data = UserDefaults.standard.value(forKey: "user-settings") as? Data {
            if let settings = try? PropertyListDecoder().decode(Settings.self, from: data) {
                self.settings = settings
            }
        }
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: "user-profile")
    }
    
    func isUserNameValid() -> Bool {
      return profile.name.count >= 3
    }

}
