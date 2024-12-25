//
//  HomeScreen.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//

import SwiftUI

/// The main home screen of the app, providing navigation to different sections.
struct HomeScreen: View {
    @StateObject var viewModel = WorkoutViewModel() // Local state object to manage app data

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Navigate to the workout logger screen
                NavigationLink(destination: WorkoutLoggerScreen(viewModel: viewModel)) {
                    HomeButton(title: "Log a Workout")
                }

                // Navigate to trends and graphs screen
                NavigationLink(destination: TrendsScreen(viewModel: viewModel)) { // Ensure TrendsScreen accepts viewModel
                    HomeButton(title: "View Trends & Graphs")
                }

                // Navigate to workout library
                NavigationLink(destination: WorkoutLibraryScreen(viewModel: viewModel)) {
                    HomeButton(title: "Workout Library")
                }

                // Navigate to menstrual tracker screen
                NavigationLink(destination: MenstrualTrackerScreen()) {
                    HomeButton(title: "Menstrual Tracker")
                }
                
                // Navigate to profile screen
                NavigationLink(destination: ProfileScreen(viewModel: viewModel)) {
                    HomeButton(title: "Profile")
                }

            
            }
            .padding()
            .navigationTitle("StrongHER Home") // Set the title of the navigation bar
        }
    }
}

/// Reusable button style for the home screen
struct HomeButton: View {
    let title: String

    var body: some View {
        Text(title)
            .padding()
            .frame(maxWidth: .infinity) // Ensure the button stretches horizontally
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(8)
    }
}

