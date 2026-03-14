//
//  FormState.swift
//  DailyPlanner
//
//  Created by Yahor Artsiomchyk on 06/03/2026.
//

import UIKit

extension ViewController {

    func currentEntryFromForm() -> PlanEntry {
        let priority: PlanEntry.Priority
        switch prioritySegmentedControl.selectedSegmentIndex {
        case 0: priority = .low
        case 1: priority = .medium
        case 2: priority = .high
        default: priority = .low
        }
        return PlanEntry(
            name: nameField.text ?? "",
            email: emailField.text ?? "",
            taskDetails: taskField.text ?? "",
            priority: priority,
            reminderEnabled: reminderSwitch.isOn,
            reminderTime: reminderSwitch.isOn ? reminderTimePicker.date : nil
        )
    }

    func syncReminderStateWithSwitch() {
        let isOn = reminderSwitch.isOn

        if isOn {
            timeContainer.isHidden = false
            timeContainer.alpha = 0

            UIView.animate(withDuration: 0.2) {
                self.timeContainer.alpha = 1
            }

        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.timeContainer.alpha = 0
            }) { _ in
                self.timeContainer.isHidden = true
            }
        }

        reminderTimePicker.isEnabled = isOn
    }

    func resetForm() {
        nameField.text = nil
        emailField.text = nil
        taskField.text = nil
        prioritySegmentedControl.selectedSegmentIndex = 0
        reminderSwitch.isOn = false
        syncReminderStateWithSwitch()
        reminderTimePicker.date = Date()
        view.endEditing(true)
    }
}
