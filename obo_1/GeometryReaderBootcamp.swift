//
//  GeometryReaderBootcamp.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/30.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        GeometryReader { geometry in
            HStack (spacing: 0){
                Rectangle()
                    .fill(Color.red)
                    .frame(width: UIScreen.main.bounds.width * 0.666)
                Rectangle().fill(Color.blue)
            }
            .ignoresSafeArea()
        }
    }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootcamp()
    }
}
