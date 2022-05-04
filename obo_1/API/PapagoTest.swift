//
//  PapagoTest.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/04.
//

import SwiftUI

let getUrl = ""
let postUrl = ""



struct Model: Decodable {
    let id: Int
    let dialogue: String
    let title: String
    let source: String
}
class ViewModel: ObservableObject {
    @Published var items: String = ""
    /*
    func loadData() {
        guard let url = URL(string: getUrl) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([Model].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.items = result
                    }
                } else {
                    print("No data")
                }
            }catch (let error) {
                print(error.localizedDescription)
            }
        }.resume()
    }
    */
    func requestAPI (sentence: String) {
        
        let text = sentence
        let param = "source=en&target=ko&text=\(text)"
        let paramData = param.data(using: .utf8)
        let Naver_URL = URL(string: "https://openapi.naver.com/v1/papago/n2mt")
        
        let clientId = "dixNpmRUwQ_43mfCyGjH"
        let clientSecret = "Rz0eZsZb6a"
        
        var request = URLRequest(url: Naver_URL!)
        request.httpMethod = "POST"
        request.addValue(clientId, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        request.httpBody = paramData
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let str = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) ?? ""
                print(str)
                
                DispatchQueue.main.async {
                    self.items = str
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
struct PapagoTestView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var testText = "This is the story of how i die."
    
    var body: some View {
        Text("Hello")
        
        NavigationView{
            VStack {
                Text(viewModel.items)
            }.onAppear(perform: {
                viewModel.requestAPI(sentence: testText)
            })
            .navigationBarTitle("Datas")
        }
         
    }
}

struct PapagoTestView_Previews: PreviewProvider{
    static var previews: some View {
        PapagoTestView()
    }
}
/*

*/
