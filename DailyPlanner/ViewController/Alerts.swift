//
//  Alerts.swift
//  DailyPlanner
//
//  Created by Yahor Artsiomchyk on 06/03/2026.
//

import UIKit

extension ViewController {

    func showValidationAlert(message: String) {
        let alert = UIAlertController(
            title: "Missing required fields",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func showSummaryAlert(entry: PlanEntry) {
        let alert = UIAlertController(
            title: "Summary",
            message: entry.summaryMessage,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(UIAlertAction(title: "Edit", style: .cancel))
        present(alert, animated: true)
    }

    func showCancelConfirmation() {
        let alert = UIAlertController(
            title: "Cancel",
            message: "Are you sure you want to cancel?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive) { [weak self] _ in
            self?.resetForm()
        })
        alert.addAction(UIAlertAction(title: "No", style: .cancel))
        present(alert, animated: true)
    }
}
