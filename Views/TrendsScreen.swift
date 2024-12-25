//
//  TrendsScreen.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//
import SwiftUI
import Charts

struct TrendsScreen: View {
    @ObservedObject var viewModel: WorkoutViewModel // Accept the ViewModel
    @State private var trends: [Trend] = [] // Initialize an empty array for trends

    var body: some View {
        VStack {
            Text("Trends & Progress")
                .font(.title) // Large title font
                .padding() // Add padding around the title
            
            if trends.isEmpty {
                Text("No trends available")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                // Chart to display trends
                Chart(trends) { trend in
                    LineMark(
                        x: .value("Date", trend.date),
                        y: .value("Volume", trend.volume)
                    )
                }
                .frame(height: 300) // Set a fixed height for the chart
            }
        }
        .onAppear {
            loadTrendsData()
        }
        .navigationTitle("Trends") // Title in the navigation bar
    }

    // Load trends data dynamically from the viewModel
    private func loadTrendsData() {
        trends = viewModel.workouts.map { workout in
            Trend(
                id: UUID(),
                date: workout.date,
                volume: workout.exercises.reduce(0) { $0 + $1.sets.reduce(0) { $0 + ($1.weight * Double($1.reps)) } },
                intensity: workout.exercises.reduce(0) { $0 + Double($1.sets.count) }
            )
        }
    }
}
