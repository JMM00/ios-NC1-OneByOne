//
//  LogView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct LogView: View {
    
    @Binding var avaliableWidth: CGFloat
    let dialogue: DialogueData
    
    var body: some View {
        NavigationView {
            VStack (spacing:10) {
                Text(dialogue.dialogue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 22, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top)
                Divider()
                HStack{
                    LogBulletView()
                    LogRawView()
                }
                Spacer().padding()
            }
            .frame(width: avaliableWidth, alignment: .center)
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("OneByOne")
//                }
//            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView(
            avaliableWidth: .constant(350),
            dialogue: DialogueData.sampleData[1]
        )
    }
}
