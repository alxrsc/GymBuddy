//
//  EditExerciseView.swift
//  Gym Buddy
//
//  Created by Alexandru Roșca on 15.07.2024.
//

import SwiftUI

struct EditExerciseView: View {
    @State var exercise: Exercise
    var onSave: (Exercise) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Exercise Name")) {
                    TextField("Name", text: $exercise.name)
                }
                Section {
                    Button(action: {
                        onSave(exercise)
                    }) {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("Edit Exercise")
            .navigationBarItems(trailing: Button(action: {
                onSave(exercise)
            }) {
                Text("Save")
            })
        }
    }
}

struct EditExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        EditExerciseView(exercise: Exercise(name: "Sample Exercise", sets: [])) { _ in }
    }
}

