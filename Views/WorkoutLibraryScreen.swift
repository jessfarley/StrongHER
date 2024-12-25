//
//  WorkoutLibraryScreen.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//

import SwiftUI

struct WorkoutLibraryScreen: View {
    @ObservedObject var viewModel: WorkoutViewModel // Access shared workout data

    var body: some View {
        NavigationView {
            List {
                // Loop through workouts with bindings for two-way data flow
                ForEach($viewModel.workouts) { $workout in
                    NavigationLink(destination: EditWorkoutView(workout: $workout, viewModel: viewModel)) {
                        Text(workout.name)
                    }
                }
                .onDelete { indexSet in
                    viewModel.workouts.remove(atOffsets: indexSet) // Handle deletion
                }
            }
            .navigationTitle("Workout Library")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: NewWorkoutView(
                        preDesignedWorkouts: viewModel.workouts, // Pass the workout library as pre-designed workouts
                        onCreate: { newWorkout in
                            viewModel.workouts.append(newWorkout) // Add the new workout to the library
                        }
                    )) {
                        Image(systemName: "plus")
                            .font(.title2) // Icon size
                    }
                }
            }
        }
    }
}

