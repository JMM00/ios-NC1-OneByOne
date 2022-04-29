//
//  ModalWordView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct ModalWordView: View {
    var body: some View {
        VStack {
            Text("just")
                .font(.system(size: 20, weight: .medium))
                .frame(width: 330, height: 24, alignment: .leading)
                .foregroundColor(Color.black)
            Text("1. (‘정확히’라는 뜻의) 딱[꼭]    2. …하는 바로[딱] 그 순간에    3. 공정한 (=fair)   4. 공정한 사람들")
                .font(.system(size: 16, weight: .medium))
                .frame(width: 330, height: 48, alignment: .leading)
                .foregroundColor(.gray)
        }
    }
}

struct ModalWordView_Previews: PreviewProvider {
    static var previews: some View {
        ModalWordView()
    }
}
