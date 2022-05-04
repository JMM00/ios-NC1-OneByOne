//
//  DownloadWithEscaping.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/05.
//

import SwiftUI

class DownloadWithEscapingViewModel: ObservableObject {
    
    @Published var wordInfo: [WordInfoElement] = []
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/just")else{ return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else{
                print("데이터가 존재하지 않습니다.")
                return
            }
            guard error == nil else {
                print("오류: \(String(describing: error))")
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("잘못된 응답입니다.")
                return
            }
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status Code는 2xx이 되야 합니다. 현재 Status Code는 \(response.statusCode) 입니다.")
                return
            }
            print("데이터 다운 성공적!!")
            print(data)
            
            
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            
            guard let newPost = try? JSONDecoder().decode(WordInfoElement.self, from: data) else {return}
            
            DispatchQueue.main.async { [weak self] in
                self?.wordInfo.append(newPost)
            }
        }
        .resume()
    }
}
struct DownloadWithEscaping: View {
    @StateObject var vm = DownloadWithEscapingViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DownloadWithEscaping_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithEscaping()
    }
}
