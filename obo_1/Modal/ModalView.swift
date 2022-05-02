//
//  ModalView.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/29.
//

import SwiftUI

struct ModalView: View {
    @Binding var showSheetView: Bool
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false, content:  {
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
                    Text("take another look at -")
                        .font(.system(size: 20, weight: .regular))
                        .frame(width: 330, height: 24, alignment: .leading)
                        .foregroundColor(.black)
                        .padding(.bottom)
                    ForEach(1..<4) { number in
                        ModalExView()
                    }
                    
    /*
                    Text("I have to take another look at book.")
                        .font(.system(size: 18, weight: .regular))
                        .frame(width: 330, height: 24, alignment: .leading)
                        .foregroundColor(Color.gray)
                    Text("I wanted to take another look at this view.")
                        .font(.system(size: 18, weight: .regular))
                        .frame(width: 330, height: 24, alignment: .leading)
                        .foregroundColor(Color.gray)
    */
    /*
                    Text("I hope taking another look at our family in our house where in my ground")
                        .font(.system(size: 18, weight: .regular))
                        .frame(width: 330, height: 24, alignment: .leading)
                        .foregroundColor(Color.gray)
    */
                    
    /*
                    List{
                        Text("take another look at -")
                            .font(.system(size: 20, weight: .regular))
                            .frame(width: 330, height: 24, alignment: .leading)
                            .foregroundColor(.black)
                        Text("I have to take another look at book.")
                            .font(.system(size: 18, weight: .regular))
                            .frame(width: 335, height: 24, alignment: .leading)
                            .foregroundColor(Color.gray)
                    }.listStyle(InsetListStyle())
                        .listRowSeparator(.hidden)
     */
                }//vstack
                
                .navigationBarTitle(Text("\""), displayMode: .inline)
                
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
        ModalView(showSheetView: .constant(true))
    }
}
