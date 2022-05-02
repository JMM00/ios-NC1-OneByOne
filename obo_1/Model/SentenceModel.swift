//
//  SentenceModel.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/03.
//

import Foundation
import SwiftUI

class SentenceModel: ObservableObject {
    @Published var spacing: CGFloat = 8
    @Published var padding: CGFloat = 8
    @Published var wordCount: Int = 75
    
    @Published var rawSentenceArray : [String] = ["I just wanted to take another look at you.",
                                                  "The greatest thing you'll ever learn is just to love and be loved in return.",
                                                   "It's only after we've lost everything that we're free to do anything",
                                                   "It is not our abilities that show what we truly are, it is our choices.",
                                                    "The past can hurt, but you can either run from it, or learn from it.",
                                                   "If we didn't do what we loved, we wouldn't exist.",
                                                   "At some point you've got to decide for yourself who you gonna be. Can't let nobody make that decision for you."]
    @Published var sentenceSource : [String] = ["A star is born",
                                                "Moulin Rouge",
                                                "Fight Club, Tyler Durben",
                                                "Dumbledore, Harry Potter",
                                                "Lion King",
                                                "Adonis",
                                                "Juan, Moonlight"]
    @Published var wordSentence:[[String]] = [["", "just", "", "to", "take", "another", "look", "at", ""],
                                            ["The", "greatest", "thing", "you'll", "ever", "learn", "is", "just", "to", "love", "and", "be", "loved", "in", "return"],
                                             ["It's", "only", "after", "we", "have", "lost", "everything", "that", "we", "are", "free", "to", "do", "anything"],
                                             ["It", "is", "not", "our", "abilities", "that", "show", "what", "we", "truly", "are", ",", "it", "is", "our", "choices"],
                                              ["The", "past", "can", "hurt", ",", "but", "you", "can", "either", "run", "from", "it", ",", "or", "learn", "from", "it"],
                                              ["If", "we", "didn't", "do", "what", "we", "loved", ",",  "we", "wouldn't", "exist"],
                                             ["At", "some", "point", "you", "have", "got", "to", "decide", "for", "yourself", "who", "you", "gonna", "be", ".", "Can't", "let", "nobody", "make", "that", "decision", "for", "you"]]
    @Published var modifySentence:[String] = []
    
    
/*
    init() {
        getData()
    }
    func getData() {
        self.rawSentenceArray.append(contentsOf: ["I just wanted to take another look at you.",
                                                "The greatest thing you'll ever learn is just to love and be loved in return.",
                                                 "It's only after we've lost everything that we're free to do anything",
                                                 "It is not our abilities that show what we truly are, it is our choices.",
                                                  "The past can hurt, but you can either run from it, or learn from it.",
                                                 "If we didn't do what we loved, we wouldn't exist.",
                                                 "At some point you've got to decide for yourself who you gonna be. Can't let nobody make that decision for you."])
        self.sentenceSource.append(contentsOf: ["A star is born",
                                               "Moulin Rouge",
                                               "Fight Club, Tyler Durben",
                                               "Dumbledore, Harry Potter",
                                               "Lion King",
                                               "Adonis",
                                               "Juan, Moonlight"])
    }
 */
    
    
    
}
