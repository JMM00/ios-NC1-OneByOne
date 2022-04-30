//
//  mainSentenceView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

let sentenceArr: [String] = ["I just wanted to take another look at you.","The greatest thing you'll ever learn is just to love and be loved in return."]
let movTitleArr: [String] = ["A star is born","Moulin Rouge"]
struct mainSentenceView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 0){
            Text("\"")
                .font(.system(size: 60, weight: .bold))
                .frame(height: 6, alignment: .center)
                .padding(.top)
            Text(sentenceArr[0])
                .font(.system(size: 30, weight: .bold))
                .frame(width: 250, height: 200, alignment: .center)
            Text(movTitleArr[0])
            Divider().frame(width: 100)
        }
    }
}

struct mainSentenceView_Previews: PreviewProvider {
    static var previews: some View {
        mainSentenceView()
    }
}
