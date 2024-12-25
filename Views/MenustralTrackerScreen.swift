//
//  MenustralTrackerScreen.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//
import SwiftUI

struct MenstrualTrackerScreen: View {
    @State private var cycleStartDate: Date = Date() // Start date of the last cycle
    @State private var averageCycleLength: Int = 28 // Default cycle length in days
    
    var body: some View {
        Form {
            // Section for entering cycle details
            Section(header: Text("Cycle Details")) {
                DatePicker("Last Period Start Date", selection: $cycleStartDate, displayedComponents: .date)
                Stepper("Average Cycle Length: \(averageCycleLength) days", value: $averageCycleLength, in: 21...35)
            }
            
            // Section for displaying predictions
            Section(header: Text("Predictions")) {
                Text("Next Period: \(calculateNextPeriod(), formatter: dateFormatter)")
            }
        }
        .navigationTitle("Menstrual Tracker") // Title in the navigation bar
    }
    
    // Function to calculate the next period's start date
    func calculateNextPeriod() -> Date {
        return Calendar.current.date(byAdding: .day, value: averageCycleLength, to: cycleStartDate) ?? Date()
    }
    
    // Formatter for displaying dates
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

