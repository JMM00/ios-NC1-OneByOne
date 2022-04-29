//
//  ModalView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        VStack {
            ModalTopView()
            Divider().frame(width: 350)
            
            Text("오늘의 단어")
                .font(.system(size: 20, weight: .medium))
                .frame(width: 335, height: 24, alignment: .leading)
                .foregroundColor(Color.gray)
                .padding()
            ModalWordView()
            ModalWordView()
            
            Divider().frame(width: 350)
            
            Text("오늘의 핵심 표현")
                .font(.system(size: 20, weight: .medium))
                .frame(width: 335, height: 24, alignment: .leading)
                .foregroundColor(Color.gray)
                .padding()
            List{
                Text("take another look at -")
                    .font(.system(size: 20, weight: .regular))
                    .frame(width: 330, height: 24, alignment: .leading)
                    .foregroundColor(.black)
                Text("I have to take another look at book.")
                    .font(.system(size: 20, weight: .regular))
                    .frame(width: 335, height: 24, alignment: .leading)
                    .foregroundColor(Color.gray)
                Text("take another look at -")
                    .font(.system(size: 20, weight: .medium))
                    .frame(width: 330, height: 24, alignment: .leading)
                    .foregroundColor(.black)
                Text("take another look at -")
                    .font(.system(size: 20, weight: .medium))
                    .frame(width: 330, height: 24, alignment: .leading)
                    .foregroundColor(.black)
                
            }
            
            
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
