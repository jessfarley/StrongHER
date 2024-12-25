//
//  ProfileScreen.swift
//  StrongHER
//
//  Created by Jessica Farley on 08/12/2024.
//

import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var viewModel: WorkoutViewModel // Access to the app's workout data

    @State private var isEditing = false // Tracks if the profile is being edited
    @State private var newName = ""
    @State private var newGoals = ""

    var body: some View {
        VStack {
            if isEditing {
                // Editable profile fields
                VStack(spacing: 16) {
                    TextField("Enter Name", text: $newName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    TextField("Enter New Goals (comma-separated)", text: $newGoals)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Save Changes") {
                        viewModel.user.name = newName
                        viewModel.user.fitnessGoals = newGoals
                            .split(separator: ",")
                            .map { $0.trimmingCharacters(in: .whitespaces) }
                        isEditing = false
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            } else {
                // Display user profile
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name: \(viewModel.user.name)")
                        .font(.title2)

                    Text("Fitness Goals:")
                    ForEach(viewModel.user.fitnessGoals, id: \.self) { goal in
                        Text("- \(goal)")
                    }
                }
                .padding()

                Button("Edit Profile") {
                    newName = viewModel.user.name
                    newGoals = viewModel.user.fitnessGoals.joined(separator: ", ")
                    isEditing = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .navigationTitle("Profile")
    }
}

