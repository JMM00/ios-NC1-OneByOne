//
//  LogRawView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct LogRawView: View {
    var body: some View {
        Text("I just wanted to take another look at her.")
            .frame(width: 330, height: 20, alignment: .leading)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius:15).stroke(lineWidth:2)
                    .foregroundColor(Color.gray)
            )
    }
}

struct LogRawView_Previews: PreviewProvider {
    static var previews: some View {
        LogRawView()
    }
}
