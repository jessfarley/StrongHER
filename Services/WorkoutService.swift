//
//  WorkoutService.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//

import Foundation

class WorkoutService {
    
    /// Calculates the total volume of a workout.
    /// - Parameter workout: A `Workout` containing exercises and sets.
    /// - Returns: The total volume (weight × reps for all sets).
    static func calculateTotalVolume(for workout: Workout) -> Double {
        return workout.exercises.flatMap { $0.sets }
            .reduce(0) { $0 + ($1.weight * Double($1.reps)) }
    }
    
    /// Suggests improvements for the next workout based on progressive overload.
    /// - Parameter workout: A `Workout` object representing the completed workout.
    /// - Returns: A recommendation string to improve the workout.
    static func suggestOverload(for workout: Workout) -> String {
        let totalVolume = calculateTotalVolume(for: workout)
        
        if totalVolume < 500 {
            return "Consider increasing your weight or adding more sets to your exercises."
        } else if totalVolume < 1000 {
            return "You're progressing well! Add a few more reps or slightly increase your weights."
        } else {
            return "Great progress! Aim to increase weight by 5% for your next session."
        }
    }
    
    /// Suggests muscle groups to target based on workout history.
    /// - Parameter workoutHistory: Array of previous `Workout` objects.
    /// - Returns: A list of undertrained muscle groups to focus on.
    static func suggestFocusAreas(from workoutHistory: [Workout]) -> [String] {
        var muscleGroupFrequency: [String: Int] = [:]
        
        // Example: Mapping exercises to muscle groups (can be expanded).
        let muscleGroupMapping: [String: String] = [
            "Squat": "Legs",
            "Deadlift": "Back",
            "Bench Press": "Chest",
            "Pull-Up": "Back",
            "Bicep Curl": "Arms",
            "Shoulder Press": "Shoulders"
        ]
        
        workoutHistory.forEach { workout in
            workout.exercises.forEach { exercise in
                if let muscleGroup = muscleGroupMapping[exercise.name] {
                    muscleGroupFrequency[muscleGroup, default: 0] += 1
                }
            }
        }
        
        let undertrainedGroups = muscleGroupFrequency.filter { $0.value < 3 }
        return undertrainedGroups.keys.sorted()
    }
}
