//
//  EditWorkoutView.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//

import SwiftUI

struct EditWorkoutView: View {
    @Binding var workout: Workout // Workout to edit
    @ObservedObject var viewModel: WorkoutViewModel // Access to the app's workout data

    var body: some View {
        Form {
            // Section for workout name
            Section(header: Text("Workout Name")) {
                TextField("Enter workout name", text: $workout.name)
            }

            // Section for exercises
            Section(header: Text("Exercises")) {
                ForEach($workout.exercises.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Exercise Name", text: $workout.exercises[index].name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        HStack {
                            Text("Weight")
                            TextField("Weight", value: $workout.exercises[index].sets[0].weight, format: .number)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Reps")
                            TextField("Reps", value: $workout.exercises[index].sets[0].reps, format: .number)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Rest (seconds)")
                            TextField("Rest", value: $workout.exercises[index].sets[0].rest, format: .number)
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
                        name: "New Exercise",
                        sets: [Set(id: UUID(), weight: 15, reps: 10, rest: 60)]
                    )
                    workout.exercises.append(newExercise)
                }) {
                    Text("Add Exercise")
                        .foregroundColor(.blue)
                }
            }
        }
        .navigationTitle("Edit Workout")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    saveWorkoutChanges() // Save changes to the workout
                }
            }
        }
    }

    /// Save changes to the workout in the ViewModel
    private func saveWorkoutChanges() {
        if let index = viewModel.workouts.firstIndex(where: { $0.id == workout.id }) {
            viewModel.workouts[index] = workout // Update the workout
        }
    }
}

