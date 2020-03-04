//
//  AlarmListTableViewController.swift
//  Alarm
//
//  Created by theevo on 3/2/20.
//  Copyright © 2020 theevo. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController {
    
    // MARK: - Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
//        print(AlarmController.shared.alarms[0].name)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmController.shared.alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? SwitchTableViewCell
            else {return UITableViewCell()}
        let alarm = AlarmController.shared.alarms[indexPath.row]
        cell.alarm = alarm
        cell.updateViews()
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 2. delete alarm from source of truth
            let index = indexPath.row
            AlarmController.shared.alarms.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? AlarmDetailTableViewController else {return}
            let alarm = AlarmController.shared.alarms[indexPath.row]
            destinationVC.alarm = alarm
            
            
        }
    }
    

}//End of Class
