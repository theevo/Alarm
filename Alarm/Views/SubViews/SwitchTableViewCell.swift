//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by theevo on 3/2/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: class {
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell)
}

class SwitchTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    weak var delegate: SwitchTableViewCellDelegate?
    
    
    //Landing Pad
    var alarm: Alarm? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    // MARK: - Lifecycle functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // MARK: - IBActions

    @IBAction func switchValueChanged(_ sender: Any) {
        delegate?.switchCellSwitchValueChanged(cell: self)
    }
    
    
    
    
    // MARK: - Helper Function
    
    func updateViews() {
        guard let alarmToView = alarm else {return}
        
        timeLabel.text = alarmToView.fireTimeAsString
        nameLabel.text = alarmToView.name
        alarmSwitch.isOn = alarmToView.enabled
    }
}//End Class
