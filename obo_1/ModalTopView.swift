//
//  ModalTopView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct ModalTopView: View {
    var body: some View {
        VStack(spacing: 0){
            Text("I just wanted to take another look at you.")
                .font(.system(size: 20, weight: .bold))
                .frame(width: 350, height: 70, alignment: .center)
            /*
            Text("그냥 다시 한번 널 보고 싶었어")
                .font(.system(size: 15, weight: .medium))
                .frame(width: 350, height: 20, alignment: .leading)
             */
            Text("- A start is born")
                .font(.system(size: 15, weight: .medium))
                .frame(width: 300, height: 20, alignment: .trailing)
                .foregroundColor(Color.gray)
        }
        .frame(width: 350, height: 100)
    }
}

struct ModalTopView_Previews: PreviewProvider {
    static var previews: some View {
        ModalTopView()
    }
}
