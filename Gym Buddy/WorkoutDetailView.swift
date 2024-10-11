//
//  WorkoutDetailView.swift
//  Gym Buddy
//
//  Created by Alexandru Roșca on 15.07.2024.
//

import SwiftUI

struct WorkoutDetailView: View {
    @State var workout: Workout
    @State private var showEditExerciseView = false
    @State private var exerciseToEdit: Exercise?

    var body: some View {
        List {
            ForEach(workout.exercises) { exercise in
                Section(header: HStack {
                    Text(exercise.name)
                    Spacer()
                    Button(action: {
                        exerciseToEdit = exercise
                        showEditExerciseView.toggle()
                    }) {
                        Image(systemName: "pencil")
                    }
                }) {
                    ForEach(exercise.sets) { set in
                        HStack {
                            Text("Weight: \(set.weight) kg")
                            Spacer()
                            Text("Reps: \(set.reps)")
                        }
                    }
                }
            }
        }
        .navigationTitle("Workout Details")
        .navigationBarItems(trailing: Button(action: {
            workout.exercises.append(Exercise(name: "New Exercise", sets: []))
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showEditExerciseView) {
            if let exerciseToEdit = exerciseToEdit {
                EditExerciseView(exercise: exerciseToEdit) { updatedExercise in
                    if let index = workout.exercises.firstIndex(where: { $0.id == updatedExercise.id }) {
                        workout.exercises[index] = updatedExercise
                    }
                    self.exerciseToEdit = nil
                }
            }
        }
    }
}
