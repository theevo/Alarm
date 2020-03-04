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
            loadViewIfNeeded()
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
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    

    // MARK: - Table view data source


    // MARK: - Helper Functions
    
    func updateViews() {
        guard let alarm = self.alarm else { return }
        timePicker.setDate(alarm.fireDate, animated: false)
        alarmName.text = alarm.name
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
