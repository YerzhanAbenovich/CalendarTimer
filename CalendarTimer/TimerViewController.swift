//
//  TimerViewController.swift
//  CalendarTimer
//
//  Created by Yerzhan Parimbay on 23.08.2025.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var finishLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var startDate: Date?
    var endDate: Date?
    var timerDate: Date = Date()
    var timer: Timer = Timer()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
            // Здесь уже есть данные из prepare(for segue:)
        startLabel.text = dateToString(startDate)
        finishLabel.text = dateToString(endDate)
        
        timerDate = startDate ?? Date()
        dateLabel.text = dateToString(timerDate)
        }
    
    
    @objc func updateProgress() {
        timerDate = Calendar.current.date(byAdding: .hour, value: 1, to: timerDate)!
        dateLabel.text = dateToString(timerDate)
                
        if let endDate = endDate, timerDate >= endDate {
            timer.invalidate()
            dateLabel.text = "Reached the target date!"
        }
    }
    
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func restart(_ sender: Any) {
        timer.invalidate()
        timerDate = startDate ?? Date()
        dateLabel.text = dateToString(timerDate)
    }
    
    func dateToString(_ date: Date?, format: String = "d MMM yyyy, EEEE, HH:mm") -> String {
        guard let date = date else { return "--" }
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
    }
}
