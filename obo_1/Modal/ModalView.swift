//
//  ModalView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct ModalView: View {
    @Binding var showSheetView: Bool
    @Binding var avaliableWidth: CGFloat
    @EnvironmentObject var sizeModel : ScreenSize
    
    let dialogue: DialogueData
    
    var body: some View {
        let width: CGFloat = avaliableWidth
        
        NavigationView {
            ScrollView (.vertical, showsIndicators: false, content:  {
                VStack{
                    ModalTopView(
                        dialogues: dialogue,
                        availablewidth: $avaliableWidth
                    )
                    Divider()
                    
                    Text("오늘의 단어")
                        .font(.title3).bold()
//                        .frame(width: avaliableWidth, height: 24, alignment: .leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.gray)
                        .padding(.vertical)
                    ModalWordView(avaliableWidth: $avaliableWidth, dialogue: dialogue)
                    Divider().padding(.vertical)
                    /*
                    Text("오늘의 핵심 표현")
//                        .font(.system(size: 20, weight: .medium))
                        .font(.title3).bold()
//                        .frame(width: width, height: 24, alignment: .leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.gray)
                        .padding(.bottom)
                    Text("take another look at -")
//                        .font(.system(size: 20, weight: .regular))
                        .font(.body).bold()
//                        .frame(width: width, height: 24, alignment: .leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.black)
                        .padding(.bottom)
                    ForEach(1..<4) { number in
                        ModalExView(avaliableWidth: $avaliableWidth)
                    }
                     */
                }//vstack
                .frame(width: width)
                .navigationBarTitle("", displayMode: .inline)
                
                .navigationBarItems(trailing: Button(action: {
                                    print("Dismissing sheet view...")
                                    self.showSheetView = false }) {
                                    Text("Done").bold()
                                })
            })//scrollview
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(
            showSheetView: .constant(true),
            avaliableWidth: .constant(350),
            dialogue: DialogueData.sampleData[1]
        )
    }
}
