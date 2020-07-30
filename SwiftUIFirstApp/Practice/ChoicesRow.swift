//
//  ChoicesRow.swift
//  SwiftUIFirstApp
//
//  Created by Himanshu Rajput on 27/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import SwiftUI

struct ChoicesRow: View {
    var choice: String
    var body: some View {
        Text(choice)
            .font(.largeTitle)
    }
}

struct ChoicesRow_Previews: PreviewProvider {
    static var previews: some View {
        ChoicesRow(choice: "Hello")
    }
}
