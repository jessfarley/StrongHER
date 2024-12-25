//
//  NewWorkoutView.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//

import SwiftUI

struct NewWorkoutView: View {
    var preDesignedWorkouts: [Workout] // Dynamic library of pre-designed workouts
    var onCreate: (Workout) -> Void // Closure to handle adding the new workout
    @State private var workout = Workout(id: UUID(), date: Date(), name: "New Workout", exercises: []) // New workout instance
    @Environment(\.presentationMode) var presentationMode // For dismissing the view

    var body: some View {
        NavigationView {
            Form {
                // Section for workout name
                Section(header: Text("Workout Name")) {
                    TextField("Enter workout name", text: $workout.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.words) // Capitalize each word
                }

                // Section for exercises
                Section(header: Text("Exercises")) {
                    if workout.exercises.isEmpty {
                        Text("No exercises added yet. Use the button below to add one.")
                            .foregroundColor(.gray)
                            .padding(.vertical)
                    }

                    ForEach($workout.exercises.indices, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 10) {
                            TextField("Exercise Name", text: $workout.exercises[index].name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.words)

                            HStack {
                                Text("Weight (kg):")
                                TextField("Enter weight", value: $workout.exercises[index].sets[0].weight, format: .number)
                                    .keyboardType(.decimalPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }

                            HStack {
                                Text("Reps:")
                                TextField("Enter reps", value: $workout.exercises[index].sets[0].reps, format: .number)
                                    .keyboardType(.numberPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }

                            HStack {
                                Text("Rest (seconds):")
                                TextField("Enter rest time", value: $workout.exercises[index].sets[0].rest, format: .number)
                                    .keyboardType(.numberPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }
                        .padding(.vertical, 5)
                    }
                    .onDelete { indexSet in
                        workout.exercises.remove(atOffsets: indexSet) // Remove exercise
                    }

                    // Button to add a new exercise
                    Button(action: {
                        let newExercise = Exercise(
                            id: UUID(),
                            name: "",
                            sets: [Set(id: UUID(), weight: 0, reps: 0, rest: 0)]
                        )
                        workout.exercises.append(newExercise)
                    }) {
                        HStack {
                            Image(systemName: "plus.circle")
                            Text("Add Exercise")
                        }
                        .foregroundColor(.blue)
                    }
                }

                // Section for pre-designed workouts
                Section(header: Text("Pre-Designed Workouts")) {
                    ForEach(preDesignedWorkouts, id: \.id) { preWorkout in
                        Button(action: {
                            workout = preWorkout // Use selected pre-designed workout
                        }) {
                            Text(preWorkout.name)
                                .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("New Workout")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        onCreate(workout) // Call closure to add the workout
                        presentationMode.wrappedValue.dismiss() // Dismiss the view
                    }
                    .disabled(workout.exercises.isEmpty || workout.name.trimmingCharacters(in: .whitespaces).isEmpty) // Disable save if no exercises or name
                }
            }
        }
    }
}

