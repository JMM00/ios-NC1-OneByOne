//
//  FlexibleView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/02.
//

import SwiftUI

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    let spacing: CGFloat
    let content: (Data.Element) -> Content
    @State private var availableWidth: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            Color.clear
                .frame(height: 1)
                .readSize { size in
                    availableWidth = size.width
                    print("______________",size.width)
                }
            
            _FlexibleView(
                availableWidth: availableWidth,
                data: data,
                spacing: spacing,
                content: content
            )
            
        }
    }
}
