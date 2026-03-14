//
//  Keyboard.swift
//  DailyPlanner
//
//  Created by Yahor Artsiomchyk on 06/03/2026.
//

import UIKit

extension ViewController {

    func setupKeyboardDismiss() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)

        nameField.delegate = self
        emailField.delegate = self
        taskField.delegate = self
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ViewController {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameField:
            emailField.becomeFirstResponder()
        case emailField:
            taskField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
