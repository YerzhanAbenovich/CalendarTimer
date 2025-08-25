//
//  ViewController.swift
//  CalendarTimer
//
//  Created by Yerzhan Parimbay on 23.08.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstDate: UIDatePicker!
    @IBOutlet weak var secondDate: UIDatePicker!
    
    var startDate: Date?
    var endDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAndOpen(_ sender: Any) {
        startDate = firstDate.date
        endDate = secondDate.date
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            if identifier == "TimerViewController" {
                startDate = firstDate.date
                endDate = secondDate.date
            }
            return true
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TimerViewController" {
            if let vc = segue.destination as? TimerViewController {
                vc.startDate = startDate
                vc.endDate = endDate
            }
        }
    }
    
}

