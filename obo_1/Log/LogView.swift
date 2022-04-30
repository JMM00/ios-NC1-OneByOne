//
//  LogView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct LogView: View {
    var body: some View {
        VStack (spacing:0) {
            Text("I just wanted to take another look at you.")
                .frame(width: 350, height: 60, alignment: .leading)
                .font(.system(size: 22, weight: .bold))
            HStack{
                LogBulletView()
                LogRawView()
            }.padding(.horizontal)
            HStack{
                LogBulletView()
                LogRawView()
            }
            HStack{
                LogBulletView()
                LogRawView()
            }
            HStack{
                LogBulletView()
                LogRawView()
            }
            HStack{
                LogBulletView()
                LogRawView()
            }
        }
        
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
