//
//  PlanEntry.swift
//  DailyPlanner
//
//  Created by Yahor Artsiomchyk on 06/03/2026.
//

import Foundation

struct PlanEntry {

    enum Priority: String, CaseIterable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
    }

    let name: String
    let email: String
    let taskDetails: String
    let priority: Priority
    let reminderEnabled: Bool
    let reminderTime: Date?

    func validate() -> String? {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedName.isEmpty {
            return "Please enter your name."
        }
        if trimmedEmail.isEmpty {
            return "Please enter your email."
        }
        return nil
    }

    var summaryMessage: String {
        let reminderLine: String
        if reminderEnabled, let time = reminderTime {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            reminderLine = "Reminder: \(formatter.string(from: time))"
        } else {
            reminderLine = "Reminder: Not set"
        }

        let taskLine = taskDetails.trimmingCharacters(in: .whitespacesAndNewlines)
        let taskDisplay = taskLine.isEmpty ? "—" : taskLine

        return """
        Name: \(name.trimmingCharacters(in: .whitespacesAndNewlines))
        E-mail: \(email.trimmingCharacters(in: .whitespacesAndNewlines))
        Task: \(taskDisplay)
        Priority: \(priority.rawValue)
        \(reminderLine)
        """
    }
}
