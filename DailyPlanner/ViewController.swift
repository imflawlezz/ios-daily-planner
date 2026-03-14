//
//  ViewController.swift
//  DailyPlanner
//
//  Created by Yahor Artsiomchyk on 06/03/2026.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var taskField: UITextField!
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var reminderSwitch: UISwitch!
    @IBOutlet weak var timeContainer: UIStackView!
    @IBOutlet weak var reminderTimePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        syncReminderStateWithSwitch()
        setupKeyboardDismiss()
    }

    @IBAction func onSwitchValueChange(_ sender: Any) {
        syncReminderStateWithSwitch()
    }

    @IBAction func onSaveButtonPress(_ sender: Any) {
        dismissKeyboard()
        let entry = currentEntryFromForm()

        if let errorMessage = entry.validate() {
            showValidationAlert(message: errorMessage)
            return
        }

        showSummaryAlert(entry: entry)
    }

    @IBAction func onCancelButtonPress(_ sender: Any) {
        showCancelConfirmation()
    }
}
