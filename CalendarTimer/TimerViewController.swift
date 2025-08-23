//
//  TimerViewController.swift
//  CalendarTimer
//
//  Created by Yerzhan Parimbay on 23.08.2025.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var finishTimer: UILabel!
    @IBOutlet weak var dateTimer: UILabel!
    
    var startDate: Date?
    var endDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startDate = startDate, let endDate = endDate {
            let formatter = DateFormatter()
                    formatter.dateStyle = .medium
                    formatter.timeStyle = .short
                    
                    startLabel.text = formatter.string(from: startDate)
                    finishTimer.text = formatter.string(from: endDate)
                    
                    // Показываем таймер до endDate
                    updateTimer()
                }
    }
    
    func updateTimer() {
        guard let endDate = endDate else { return }
              let now = Date()
              let remainingSeconds = Int(endDate.timeIntervalSince(now))
        if remainingSeconds > 0 {
                let hours = remainingSeconds / 3600
                let minutes = (remainingSeconds % 3600) / 60
                let seconds = remainingSeconds % 60
                
                dateTimer.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
            } else {
                dateTimer.text = "Время вышло!"
            }
    }
    
    @IBAction func start(_ sender: Any) {
    }
    @IBAction func stop(_ sender: Any) {
    }
    @IBAction func restart(_ sender: Any) {
    }
    
    

}
