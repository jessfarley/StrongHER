//
//  User.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//
import Foundation

// Represents the user profile
struct User: Codable, Identifiable {
    let id: UUID // Unique identifier for the user
    var name: String // Name of the user
    var fitnessGoals: [String] // Fitness goals (e.g., "Weight Loss", "Strength")
    var workoutHistory: [Workout] // History of logged workouts
    var preferences: Preferences // User preferences
}

// Stores user preferences, such as available equipment and dietary needs
struct Preferences: Codable {
    var equipmentAvailable: [String] // Equipment the user has (e.g., "Dumbbells")
    var mealType: String // Dietary preference (e.g., "Vegetarian")
}

