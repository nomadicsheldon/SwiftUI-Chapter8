//
//  LogoImage.swift
//  SwiftUIApp(chapter6)
//
//  Created by Himanshu Rajput on 24/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import SwiftUI

struct LogoImage: View {
    var body: some View {
        Image(systemName: "calendar.circle.fill")
        .resizable()
        .frame(width: 30, height: 30)
        //            .cornerRadius(30/2)
        .overlay(Circle().stroke(Color.red, lineWidth: 1))
        .background(Color(white: 0.9))
        .clipShape(Circle())
        .foregroundColor(.red)
    }
}

struct LogoImage_Previews: PreviewProvider {
    static var previews: some View {
        LogoImage()
    }
}
