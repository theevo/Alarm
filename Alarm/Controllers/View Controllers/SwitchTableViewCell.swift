//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by theevo on 3/2/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    //Landing Pad
    var alarm: Alarm?
    
    // MARK: - IBOutlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    // MARK: - Lifecycle functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - IBActions

    @IBAction func switchValueChanged(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - Helper Functiosn
    func updateViews() {
        guard let alarmToView = alarm else { return }
        
        nameLabel.text = alarmToView.name
        alarmSwitch.isOn = alarmToView.enabled
        // timeLabel - how do we set the time in a date picker?
    }
}//End Class
