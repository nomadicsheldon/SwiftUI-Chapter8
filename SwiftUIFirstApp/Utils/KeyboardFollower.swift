//
//  KeyboardFollower.swift
//  SwiftUIFirstApp
//
//  Created by Himanshu Rajput on 25/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import UIKit

class KeyboardFollower: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    @Published var isVisible = false
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardVisibilityChanged), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc private func keyboardVisibilityChanged(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardEndFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        print("keyboardEndFrame.minY", keyboardEndFrame.minY)
        print("UIScreen.main.bounds.height", UIScreen.main.bounds.height)
        isVisible = keyboardEndFrame.minY < UIScreen.main.bounds.height
        keyboardHeight = isVisible ? keyboardEndFrame.height : 0
    }
}
