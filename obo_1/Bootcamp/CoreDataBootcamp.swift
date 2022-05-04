//
//  CoreDataBootcamp.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/05/04.
//

import SwiftUI
import CoreData

//View - UI
//Model - data point
//ViewModel - manages the data for a view


struct CoreDataBootcamp: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: SentenceEntity.entity(),
        sortDescriptors: [
            NSSortDescriptor(
                keyPath: \SentenceEntity.sentenceModified,
                ascending: true)
        ]
    )
    private var sentencesModified: FetchedResults<SentenceEntity>
    
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                TextField("add sentence here...", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                Button (action: {
                    guard !textFieldText.isEmpty else {return}
                    print("____",textFieldText)
                    vm.addSentence(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("submit")
                        .font(.headline)
                        .padding(.leading)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                })
                .padding(.horizontal)
                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.sentenceModified ?? "NO SENTENCE")
                    }
                    .onDelete(perform: vm.deleteSentence)
                }
                .listStyle(PlainListStyle())

            }
            .navigationTitle("Title")
        }
    }
}

struct CoreDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp()
    }
}
