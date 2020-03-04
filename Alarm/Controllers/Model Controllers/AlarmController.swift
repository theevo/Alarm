//
//  AlarmController.swift
//  Alarm
//
//  Created by theevo on 3/2/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import Foundation

class AlarmController {
    //source of truth
    var alarms: [Alarm] = []
    
    //Singleton
    static let shared = AlarmController()
    
    // MARK: - Mock data
    var mockAlarms: [Alarm] {
//        let sixThirty = Da
        let wakeUp = Alarm(fireDate: Date(), name: "Rise and Shine", enabled: true)
        let classTime = Alarm(fireDate: Date(), name: "Class Time", enabled: false)
        return [wakeUp, classTime]
    }
    
    init() {
     self.alarms = self.mockAlarms
    }
    
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
    
    static func toggleIsOn(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
    }
}//End of Class
