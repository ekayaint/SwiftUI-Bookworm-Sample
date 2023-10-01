//
//  SwiftUI_Bookworm_SampleApp.swift
//  SwiftUI-Bookworm-Sample
//
//  Created by ekayaint on 30.09.2023.
//

import SwiftUI

@main
struct SwiftUI_Bookworm_SampleApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
