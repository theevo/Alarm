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
    
    static let alarmNamePlaceholders = [
        "Walk the dog",
        "Buy wine",
        "Douse the kitchen in bleach",
        "Give roommate a no-touch high five",
        "Drive to Lehi",
        "Buy flowers for schnookums",
        "Fix .gitignore_global",
        "Install oh my zsh",
        "Stock up on toilet paper"
    ]
    
    // MARK: - Mock data
    var mockAlarms: [Alarm] {
//        let sixThirty = Da
        let wakeUp = Alarm(fireDate: Date(), name: "Rise and Shine", enabled: true)
        let classTime = Alarm(fireDate: Date(), name: "Class Time", enabled: false)
        return [wakeUp, classTime]
    }
    
    init() {
     self.alarms = self.mockAlarms
    loadFromPersistence()
    }
    
    // MARK: - CRUD
    //Create
    func addAlarm(fireDate: Date, name: String, enabled: Bool) -> Alarm {
        let alarm = Alarm(fireDate: fireDate, name: name, enabled: enabled)
        alarms.append(alarm)
        saveToPersistentStorage(alarms: alarms)
        return alarm
    }
    
    //Update
    func update(alarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        alarm.fireDate = fireDate
        alarm.name = name
        alarm.enabled = enabled
        saveToPersistentStorage(alarms: alarms)
        }
    //Delete
    func delete(alarm: Alarm) {
        guard let index = alarms.firstIndex(of: alarm) else {return}
        alarms.remove(at: index)
        saveToPersistentStorage(alarms: alarms)
    }
    
    static func toggleIsOn(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
    }
    
    // MARK: - Persistance
    //MARK: - Persistence
    func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "AlarmHazTheo.json"
        let documentDirectory = urls[0]
        let documentsDirectoryURL = documentDirectory.appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    func saveToPersistentStorage(alarms: [Alarm]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(alarms)
            try data.write(to: fileURL())
        } catch let error {
            print("There was an error saving to persistent storage: \(error)")
        }
    }
    func loadFromPersistence() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let decodedData = try jsonDecoder.decode([Alarm].self, from: data)
            self.alarms = decodedData
        } catch let error {
            print("\(error.localizedDescription) -> \(error)")
        }
    }
}//End of Class
