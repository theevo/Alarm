//
//  AlarmController.swift
//  myAlarm
//
//  Created by Jake Haslam on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

class AlarmController {
    //source of truth
    var alarms: [Alarm] = []
    
    //Singleton
    static let shared = AlarmController()
    
    // MARK: - CRUD
    //Create
    func addAlarm(fireDate: Date, name: String, enabled: Bool) -> Alarm {
        let alarm = Alarm(fireDate: fireDate, name: name, enabled: enabled)
        alarms.append(alarm)
        return alarm
    }
    
    //Update
    func update(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        alarm.fireDate = fireDate
        alarm.name = name
        alarm.enabled = enabled
        }
    //Delete
    func delete(alarm: Alarm) {
        guard let index = alarms.firstIndex(of: alarm) else {return}
        alarms.remove(at: index)
    }
}//End of Class


