//
//  LogBulletView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct LogBulletView: View {
    var body: some View {
        ZStack {
            Path{ path in
                // 1. 커서 이동
                path.move(to: CGPoint(x: 10, y: 0))
                // 2.
                path.addLine(to: CGPoint(x: 10, y: 60))
            }
            .stroke()
            Circle().foregroundColor(Color.black)
                .frame(width: 10, height: 10)
        }
        .frame(height: 60)
    }
}

struct LogBulletView_Previews: PreviewProvider {
    static var previews: some View {
        LogBulletView()
    }
}
