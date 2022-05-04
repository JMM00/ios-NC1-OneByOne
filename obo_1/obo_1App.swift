//
//  obo_1App.swift
//  obo_1
//
//  Created by Jeon Jimin on 2022/04/28.
//

import SwiftUI

@main
struct obo_1App: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
//            DownloadWithEscaping()
//            PapagoTestView()
            ContentView(dialogues: DialogueData.sampleData)
//            CoreDataBootcamp()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
