//
//  WelcomeBackgroundImage.swift
//  SwiftUIApp(chapter6)
//
//  Created by Himanshu Rajput on 24/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import SwiftUI

struct WelcomeBackgroundImage: View {
    var body: some View {
        Image("welcome-background")
        .resizable()
        //                .scaledToFit()
        .aspectRatio(1/1, contentMode: .fill)
        .edgesIgnoringSafeArea(.all)
        .saturation(0.5)
        .blur(radius: 5)
        .opacity(0.08)
    }
}

struct WelcomeBackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackgroundImage()
    }
}
