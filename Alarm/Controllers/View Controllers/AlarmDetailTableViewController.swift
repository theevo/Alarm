//
//  AlarmDetailTableViewController.swift
//  Alarm
//
//  Created by theevo on 3/2/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController, AlarmScheduler {
    
    // MARK: - properties
    var alarm: Alarm? {
        didSet {
            alarmIsOn = alarm?.enabled ?? true
            loadViewIfNeeded() //why is this safest??
            updateViews()
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
            let fireDate = timePicker?.date else {return}
        
        if let alarm = alarm {
            // UPDATE
            AlarmController.shared.update(alarm: alarm, fireDate: fireDate, name: alarmTitle, enabled: alarmIsOn)
            
            toggleAlarmNotification(for: alarm)
        } else {
            // CREATE
            let alarm = AlarmController.shared.addAlarm(fireDate: fireDate, name: alarmTitle, enabled: alarmIsOn)
            toggleAlarmNotification(for: alarm)
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
            let newAlarmTime = Date().addingTimeInterval(1.0 * 60.0) // param = number of seconds
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
    
    func toggleAlarmNotification(for alarm: Alarm) {
        if alarmIsOn {
            scheduleUserNotifications(for: alarm)
        } else {
            cancelUserNotifications(for: alarm)
        }
    }
}
