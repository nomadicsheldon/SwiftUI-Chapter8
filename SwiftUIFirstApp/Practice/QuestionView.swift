//
//  QuestionView.swift
//  SwiftUIFirstApp
//
//  Created by Himanshu Rajput on 27/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    var question: String
    
    var body: some View {
        Text(question)
        .font(.system(size: 64))
        .allowsTightening(true)
        .foregroundColor(.red)
        .lineLimit(5)
        .multilineTextAlignment(.center)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: "口")
    }
}
