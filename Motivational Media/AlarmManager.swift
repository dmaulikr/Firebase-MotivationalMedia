//
//  AlarmManager.swift
//  Motivational Media
//
//  Created by Komran Ghahremani on 2/5/15.
//  Copyright (c) 2015 Komreezy. All rights reserved.
//

import UIKit

struct alarm{
    var name: String = "No-Name"
    var time: String = "10:30pm"
}

class AlarmManager: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Array to hold all of the alarms
    var alarmArray = [alarm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //appending an alarm to the array
    func addAlarm(nameParam: String, timeParam: String){
        alarmArray.append(alarm(name: nameParam, time: timeParam))
    }
    
    //data source methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return alarmArray.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = alarmArray[indexPath.row].name
        cell.detailTextLabel?.text = String(alarmArray[indexPath.row].time)
        
        return cell
    }
}
