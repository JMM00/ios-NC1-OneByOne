// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wordInfo = try? newJSONDecoder().decode(WordInfo.self, from: jsonData)

import Foundation

// MARK: - WordInfoElement
struct WordInfoElement: Codable {
    let word: String
//    let meanings: [Meaning]
//    
//    enum CodeKeys: String, CodingKey {
//        case word = "word"
//        case meanings
//    }
}
// MARK: - Meaning
struct Meaning {
    let partOfSpeech: String
    let definitions: [Definition]
    let synonyms, antonyms: [String]
}

// MARK: - Definition
struct Definition{
    let definition: String
    let synonyms, antonyms: [Any?]
    let example: String?
}
 
