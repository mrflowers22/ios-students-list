//
//  StudentsTableViewController.swift
//  Students
//
//  Created by Michael Flowers on 5/6/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {
    
    var students: [Student] = [] {
        didSet {
            //when the student array is set we want to update the table view
            tableView.reloadData()
        }
    }

    //if we are overrding the viewDidLoad but we are not usng it or doing anything differently then the original or super viewDidLoad will run 
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = students[indexPath.row].name
        return cell
    }
}
