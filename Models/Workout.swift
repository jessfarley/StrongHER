//
//  Workout.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//
import Foundation

// Represents a complete workout
struct Workout: Identifiable, Codable {
    let id: UUID // Unique identifier for each workout
    let date: Date // Date the workout was performed
    var name: String // Add this property for the workout name
    var exercises: [Exercise] // List of exercises in the workout
    var notes: String? // Optional notes about the workout (e.g., mood, performance)
}

// Represents a single exercise in a workout
struct Exercise: Identifiable, Codable {
    let id: UUID // Unique identifier for each exercise
    var name: String // Name of the exercise (e.g., "Squat")
    var sets: [Set] // List of sets performed for this exercise
    var equipment: String? // Optional equipment used (e.g., "Barbell")
}

// Represents a single set within an exercise
struct Set: Identifiable, Codable {
    let id: UUID // Unique identifier for each set
    var weight: Double // Weight lifted during the set
    var reps: Int // Number of repetitions performed
    var rest: TimeInterval // Rest time between sets (in seconds)
}
