//
//  WheatherButton.swift
//  App-EvF
//
//  Created by Azael Reyna on 29/11/21.
//

import SwiftUI

struct WheatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color

    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
