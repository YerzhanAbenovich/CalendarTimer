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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TimerViewController" {
            if let vc = segue.destination as? TimerViewController {
                vc.startDate = firstDate.date
                vc.endDate = secondDate.date
            }
        }
    }


}

