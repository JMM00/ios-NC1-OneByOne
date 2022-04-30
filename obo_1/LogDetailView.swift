//
//  LogDetailView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/30.
//

import SwiftUI

struct LogDetailView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("I just wanted to take another look at you.")
                .font(.system(size: 20, weight: .bold))
                .frame(width: .infinity, height: 70, alignment: .center)
            Text("그냥 다시 한번 널 보고 싶었어.")
                .font(.system(size: 15, weight: .medium))
                .frame(width: .infinity, height: 20, alignment: .leading)
            Divider().padding(.bottom)
            
            LogRawView()
            LogRawView()
        }
        .frame(width: 350, height: 700, alignment: .top)
        
        
    }
}

struct LogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LogDetailView()
    }
}
