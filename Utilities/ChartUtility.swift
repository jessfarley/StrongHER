//
//  ChartUtility.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//

import SwiftUI
import Charts

class ChartUtility {
    /// Generates a line chart based on the trends provided.
    /// - Parameter trends: An array of `Trend` objects containing data points.
    /// - Returns: A SwiftUI view displaying the line chart.
    static func generateLineChart(for trends: [Trend]) -> some View {
        Chart(trends) { trend in
            LineMark(
                x: .value("Date", trend.date), // X-axis is the date
                y: .value("Volume", trend.volume) // Y-axis is the workout volume
            )
        }
    }

    /// Generates a bar chart for a summary of weekly workout stats.
    /// - Parameter weeklyData: An array of tuples containing week and total volume.
    /// - Returns: A SwiftUI view displaying the bar chart.
    static func generateBarChart(for weeklyData: [(week: String, volume: Double)]) -> some View {
        Chart(weeklyData, id: \.week) { data in
            BarMark(
                x: .value("Week", data.week), // X-axis is the week
                y: .value("Volume", data.volume) // Y-axis is the total volume
            )
        }
    }
}

