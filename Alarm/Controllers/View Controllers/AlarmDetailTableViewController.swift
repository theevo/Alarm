//
//  AlarmDetailTableViewController.swift
//  Alarm
//
//  Created by theevo on 3/2/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    // MARK: - properties
    var alarm: Alarm? {
        didSet {
            alarmIsOn = alarm?.enabled ?? true
            loadViewIfNeeded() //why is this safest??
            updateViews() // q: why do we call this here?
            //why isnt updateAlarm called here?
            }
    }
    var alarmIsOn: Bool = true
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var alarmName: UITextField!
    @IBOutlet weak var alarmButton: UIButton!
    
    
    // MARK: - Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        updateAlarm()
    }
    
    
    // MARK: - IBActions
    
    @IBAction func enableButtonTapped(_ sender: Any) {
        alarmIsOn = !alarmIsOn
        updateAlarm()
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let alarmTitle = alarmName.text,
            let dateTitle = timePicker?.date else {return}
        
        // UPDATE
        if let alarm = alarm {
            AlarmController.shared.update(alarm: alarm, fireDate: dateTitle, name: alarmTitle, enabled: alarmIsOn)
        } else {
            // CREATE
            AlarmController.shared.addAlarm(fireDate: dateTitle, name: alarmTitle, enabled: alarmIsOn)
        }
        navigationController?.popViewController(animated: true)
    }
    

    // MARK: - Table view data source


    // MARK: - Helper Functions
    
    func updateViews() {
        if let alarm = self.alarm {
            timePicker.setDate(alarm.fireDate, animated: false)
            alarmName.text = alarm.name
        }  else {
            let newAlarmTime = Date().addingTimeInterval(25.0 * 60.0) // param = number of seconds
            timePicker.setDate(newAlarmTime, animated: true)
            alarmName.text = AlarmController.alarmNamePlaceholders.randomElement()
        }
    }
    
    func updateAlarm() {
        if alarmIsOn {
            alarmButton.setTitle("Turn OFF", for: .normal)
            alarmButton.backgroundColor = .red
        } else {
            alarmButton.setTitle("Turn ON", for: .normal)
            alarmButton.backgroundColor = .green
        }
    }
}
