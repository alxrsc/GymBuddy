//
//  AddExerciseView.swift
//  Gym Buddy
//
//  Created by Alexandru Roșca on 15.07.2024.
//

import SwiftUI

struct AddExerciseView: View {
    @Binding var workout: Workout

    @State private var exerciseName = ""
    @State private var sets: [ExerciseSet] = []

    var body: some View {
        Form {
            Section(header: Text("Exercise Name")) {
                TextField("Name", text: $exerciseName)
            }

            Section(header: Text("Sets")) {
                ForEach(sets) { set in
                    HStack {
                        Text("Weight: \(set.weight) kg")
                        Spacer()
                        Text("Reps: \(set.reps)")
                    }
                }
                Button(action: {
                    sets.append(ExerciseSet(weight: 0, reps: 0))
                }) {
                    Text("Add Set")
                }
            }

            Button(action: {
                let newExercise = Exercise(name: exerciseName, sets: sets)
                workout.exercises.append(newExercise)
            }) {
                Text("Save Exercise")
            }
        }
        .navigationTitle("Add Exercise")
    }
}

