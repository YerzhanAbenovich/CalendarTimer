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
    
    var startDate: Date = Date()
    var endDate: Date = Date()
    var timerDate: Date = Date()
    var timer: Timer = Timer()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLabel.text = dateToString(startDate)
        finishLabel.text = dateToString(endDate)
        dateLabel.text = dateToString(timerDate)
        timerDate = startDate
    }
    
    
    @objc func updateProgress() {
           // Увеличиваем текущую дату на 1 час
        timerDate = Calendar.current.date(byAdding: .hour, value: 1, to: timerDate)!
           
           // Обновляем label
        dateLabel.text = dateToString(timerDate)
           
           // Проверяем, не дошли ли мы до endDate
        if timerDate >= endDate {
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
        timerDate = startDate
        dateLabel.text = dateToString(timerDate)
    }
    
    func dateToString(_ date: Date, format: String = "d MMM yyyy, EEEE, hh:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
        
        //конвертер с date на string
    }
}
