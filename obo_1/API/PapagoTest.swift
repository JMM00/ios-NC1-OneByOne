//
//  PapagoTest.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/04.
//

import SwiftUI
/*
struct Model: Decodable {
    let id: UUID
    let dialogue: String
    let title: String
    let source: String
}
 */
class ViewModel: ObservableObject {
    @Published var items: String = ""
    @Published var text: String = ""
    
    func requestAPI (sentence: String){
        
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
                
                //확인차 출력
                print(str)
                
                //결과 변환 코드
                let decoder = JSONDecoder()
                
                if let data = str.data(using: .utf8) {
                    do {
                        let decodedResult = try decoder.decode(Welcome.self, from: data)
                        print("decodedResult____________",decodedResult)
//                        self.text = decodedResult.message.result.translatedText
                        DispatchQueue.main.async {
                            self.items = str
                            self.text = decodedResult.message.result.translatedText
                        }
                    }
                    catch let DecodingError.dataCorrupted(context) {
                        print(context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                    }
                    return
                }
            }
            if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
//        print(self.text,"requestAPI____self.text")
    }
}

/*
struct PapagoTestView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var testText = "This is the story of how i die."
    
    var body: some View {
        NavigationView{
            VStack {
                Text(viewModel.items)
                Divider()
                Text(viewModel.text)
            }.onAppear(perform: {
                let _ = viewModel.requestAPI(sentence: testText)
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
 */
