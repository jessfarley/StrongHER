//
//  WorkoutloggerScreen.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//
import SwiftUI

struct WorkoutLoggerScreen: View {
    @ObservedObject var viewModel: WorkoutViewModel // Shared ViewModel for data consistency
    @State private var isCreatingNewWorkout = false // Whether the user is creating a new workout

    var body: some View {
        NavigationView {
            VStack {
                // Display workouts or show an empty state message
                if viewModel.workouts.isEmpty {
                    Text("No workouts logged yet. Add one below!")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach($viewModel.workouts) { $workout in // Use $viewModel.workouts to get bindings
                            NavigationLink(destination: EditWorkoutView(workout: $workout, viewModel: viewModel)) {
                                VStack(alignment: .leading) {
                                    Text("Workout: \(workout.date.formatted(date: .abbreviated, time: .shortened))")
                                        .font(.headline)
                                    Text("\(workout.exercises.count) Exercises")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .onDelete(perform: deleteWorkout)
                    }
                }

                Spacer()

                // Add Workout Button
                Button(action: {
                    isCreatingNewWorkout = true
                }) {
                    Text("Add Workout")
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .sheet(isPresented: $isCreatingNewWorkout) {
                NewWorkoutView(
                    preDesignedWorkouts: viewModel.workouts, // Pass the dynamic library
                    onCreate: addNewWorkout // Closure to add the workout
                )
            }

            .navigationTitle("Log Workout")
        }
    }

    // Add a new workout to the list
    func addNewWorkout(_ workout: Workout) {
        viewModel.workouts.append(workout) // Append the new workout
        isCreatingNewWorkout = false
    }

    // Delete a workout from the list
    func deleteWorkout(at offsets: IndexSet) {
        viewModel.workouts.remove(atOffsets: offsets) // Remove the workout
    }
}

