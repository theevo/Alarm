//
//  Alarm.swift
//  myAlarm
//
//  Created by Jake Haslam on 3/2/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit
/**
Creates our Setting Object- *MODEL*
- Properties:
- name: The `String` identifier for the Setting
- icon: `UIImage` that matches the Setting
-isOn: The `Bool` to designate whether the setting is on our not
*/
class Alarm {
    var fireDate: Date
    var name: String
    var enabled: Bool
    let uuid: String
    
    var fireTimeAsString: String {
        get {
            let dateFormatter = DateFormatter()
            return dateFormatter.string(from: fireDate)
        }
    }
    
    init(fireDate: Date, name: String, enabled: Bool, uuid: String = UUID().uuidString) {
        self.fireDate = fireDate
        self.name = name
        self.enabled = enabled
        //self.uuid = UUID().uuidString
    }
    
    
}//End of Class

extension Alarm: Equatable {
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
       return lhs.fireDate == rhs.fireDate &&
        lhs.name == rhs.name &&
        lhs.enabled == rhs.enabled &&
        lhs.uuid == rhs.uuid
        
    }
    
    
}
