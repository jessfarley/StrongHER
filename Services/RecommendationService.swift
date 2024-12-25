//
//  RecommendationService.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//

import Foundation

class RecommendationService {
    
    /// Recommends a workout plan for the next day based on goals and menstrual cycle phase.
    /// - Parameters:
    ///   - goals: User's fitness goals (e.g., "Strength Building", "Weight Loss").
    ///   - cyclePhase: The user's current menstrual cycle phase.
    /// - Returns: A string recommendation for the workout.
    static func recommendWorkout(for goals: [String], cyclePhase: String) -> String {
        var recommendations = [String]()
        
        // Cycle phase-based recommendations
        switch cyclePhase.lowercased() {
        case "follicular":
            recommendations.append("Focus on strength training exercises like squats, deadlifts, or bench press.")
        case "luteal":
            recommendations.append("Incorporate moderate-intensity workouts, such as yoga, Pilates, or bodyweight exercises.")
        case "menstrual":
            recommendations.append("Prioritize lighter exercises like walking or stretching to promote recovery.")
        default:
            recommendations.append("Maintain a balanced workout routine based on your goals.")
        }
        
        // Goal-based recommendations
        if goals.contains("Strength Building") {
            recommendations.append("Increase weight for compound lifts and focus on lower rep ranges.")
        }
        if goals.contains("Weight Loss") {
            recommendations.append("Incorporate high-intensity interval training (HIIT) to maximize calorie burn.")
        }
        if goals.contains("Postpartum Recovery") {
            recommendations.append("Add pelvic floor and core strengthening exercises to your routine.")
        }
        
        return recommendations.joined(separator: "\n")
    }
    
    /// Recommends meals based on fitness goals and dietary preferences.
    /// - Parameters:
    ///   - goals: User's fitness goals.
    ///   - mealType: User's dietary preference (e.g., "Vegetarian", "Low Carb").
    /// - Returns: A string suggestion for meals.
    static func recommendMeals(for goals: [String], mealType: String) -> String {
        var mealSuggestions = [String]()
        
        switch mealType.lowercased() {
        case "vegetarian":
            mealSuggestions.append("Breakfast: Scrambled eggs with avocado and whole-grain toast.")
            mealSuggestions.append("Lunch: Lentil soup with a side of quinoa and roasted vegetables.")
            mealSuggestions.append("Dinner: Chickpea curry served with brown rice.")
        case "low carb":
            mealSuggestions.append("Breakfast: Omelet with spinach, mushrooms, and cheese.")
            mealSuggestions.append("Lunch: Grilled chicken salad with olive oil and avocado.")
            mealSuggestions.append("Dinner: Pan-seared salmon with steamed broccoli and cauliflower mash.")
        default:
            mealSuggestions.append("Breakfast: Greek yogurt with mixed berries and granola.")
            mealSuggestions.append("Lunch: Grilled turkey sandwich with a side of mixed greens.")
            mealSuggestions.append("Dinner: Stir-fried tofu and vegetables with a side of jasmine rice.")
        }
        
        return mealSuggestions.joined(separator: "\n")
    }
    
    /// Provides general health tips to improve performance and recovery.
    /// - Returns: A list of health tips as strings.
    static func generalHealthTips() -> [String] {
        return [
            "Stay hydrated by drinking at least 2 liters of water daily.",
            "Prioritize sleep—aim for 7-8 hours per night for optimal recovery.",
            "Incorporate stretching or mobility exercises into your routine to improve flexibility.",
            "Listen to your body—rest when you feel fatigued or sore."
        ]
    }
}
