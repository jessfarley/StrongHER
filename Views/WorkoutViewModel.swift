//
//  WorkoutViewModel.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var workouts: [Workout] = [
        // Example pre-filled workouts
        Workout(
            id: UUID(),
            date: Date(), name: "Example Workout",
            exercises: [
                Exercise(
                    id: UUID(),
                    name: "Push-Ups",
                    sets: [Set(id: UUID(), weight: 0, reps: 12, rest: 60)]
                ),
                Exercise(
                    id: UUID(),
                    name: "Squats",
                    sets: [Set(id: UUID(), weight: 15, reps: 10, rest: 90)]
                )
            ],
            notes: nil
        )
    ]
    @Published var user: User = User(
        id: UUID(),
        name: "Jessica Farley",
        fitnessGoals: ["Strength Building", "Weight Loss"],
        workoutHistory: [],
        preferences: Preferences(
            equipmentAvailable: ["Dumbbells", "Resistance Bands"],
            mealType: "Vegetarian"
        )
    )
}

