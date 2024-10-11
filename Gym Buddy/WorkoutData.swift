//
//  WorkoutData.swift
//  Gym Buddy
//
//  Created by Alexandru Roșca on 15.07.2024.
//

import Foundation

struct Exercise: Identifiable, Codable {
    var id = UUID()
    var name: String
    var sets: [ExerciseSet]
}

struct ExerciseSet: Identifiable, Codable {
    var id = UUID()
    var weight: Double
    var reps: Int
}

struct Workout: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var exercises: [Exercise]
}

class WorkoutData: ObservableObject {
    @Published var workouts: [Workout] {
        didSet {
            saveWorkouts()
        }
    }

    init() {
        self.workouts = UserDefaults.standard.decode([Workout].self, forKey: "workouts") ?? []
    }

    func saveWorkouts() {
        UserDefaults.standard.encode(workouts, forKey: "workouts")
    }
}

extension UserDefaults {
    func encode<T: Encodable>(_ value: T, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(value) {
            set(encoded, forKey: key)
        }
    }

    func decode<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
        if let data = data(forKey: key) {
            return try? JSONDecoder().decode(type, from: data)
        }
        return nil
    }
}
