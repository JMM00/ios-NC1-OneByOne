//
//  writingView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/02.
//

import SwiftUI

struct writingView: View {
    let word = ["", "just", "", "to", "take", "another", "look" ,"at" ,""]
    
    @State private var availableWidth: CGFloat = 0
    var body: some View {
        ZStack{
            Color.clear
                .frame(height: 1)
                .readSize { size in
                    availableWidth = size.width
                    
                }
            
            VStack {
                ModalTopView()
                Divider()
                Spacer()
                
                Text("1단계: 빈칸을 채워 나만의 문장을 완성하세요!")
                Spacer()
            
                HStack{
                    ForEach(word, id: \.self) { item in
                        if (item.isEmpty){
                            Text("쿠쿠루삥뽕")
                        }else{
                            Text(item)
                        }
                        
                    }
                }
                
            }
            .frame(maxWidth: 350, maxHeight: .infinity)
        }
    }
}

struct writingView_Previews: PreviewProvider {
    static var previews: some View {
        writingView()
    }
}
