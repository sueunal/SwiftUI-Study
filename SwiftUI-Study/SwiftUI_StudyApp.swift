//
//  SwiftUI_StudyApp.swift
//  SwiftUI-Study
//
//  Created by sueun kim on 4/24/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_StudyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            DynamicKeyboardView()
        }
        .modelContainer(sharedModelContainer)
    }
}
