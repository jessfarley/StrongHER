//
//  Trend.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//
import Foundation

// Represents a single data point for tracking trends (e.g., volume, intensity)
struct Trend: Identifiable, Codable {
    var id: UUID // Unique identifier for each trend point
    var date: Date // Date of the trend data
    var volume: Double // Total weight lifted on that day
    var intensity: Double // Average intensity of the workout
}


