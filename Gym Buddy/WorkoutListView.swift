//
//  WorkoutListView.swift
//  Gym Buddy
//
//  Created by Alexandru Roșca on 15.07.2024.
//

import SwiftUI

struct WorkoutListView: View {
    @ObservedObject var workoutData = WorkoutData()

    var body: some View {
        NavigationView {
            List {
                ForEach(workoutData.workouts) { workout in
                    NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                        Text("Workout on \(workout.date, formatter: dateFormatter)")
                    }
                }
            }
            .navigationTitle("Gym Buddy")
            .navigationBarItems(trailing: Button(action: {
                workoutData.workouts.append(Workout(date: Date(), exercises: []))
            }) {
                Image(systemName: "plus")
            })
        }
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
