//
//  StrongHERApp.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//

import SwiftUI

@main
struct StrongHerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen(viewModel: WorkoutViewModel()) // Pass the view model here
        }
    }
}

