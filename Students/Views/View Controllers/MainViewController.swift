//
//  MainViewController.swift
//  Students
//
//  Created by Michael Flowers on 5/6/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let networkClient = NetworkClient()
    private var studentsTableViewController: StudentsTableViewController! { //this is to grab a hold of the other view controller - the view controller inside of the container view
        didSet {
            updateSort()
        }
    }
    
    private var students = [Student]() {
        didSet {
            updateSort()
        }
    }
    
    @IBOutlet weak var sortSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkClient.fetchStudents { (students, error) in
            if let error = error {
                print("Error loading from students: \(error.localizedDescription)")
                return
            }
            
            //students have data in it
            DispatchQueue.main.async {
                //we have to switch back to the main queue because network calls are done on the background thread
                //also, we need to asign something from the internet to a property that will be dsplayed on the UI
                self.students = students ?? []
            }
        }
    }
    
    @IBAction func sort(_ sender: UISegmentedControl){
        updateSort()
    
    }
    
    private func updateSort(){
        //make sure the table view is showing the right data
        let sortedStudents: [Student]
        if sortSelector.selectedSegmentIndex == 0 {
            sortedStudents = students.sorted { $0.firstName < $1.firstName } //a-z
        } else {
            //sort based on last name
            sortedStudents = students.sorted { ($0.lastName ?? "") < ($1.lastName ?? "") }
        }
        studentsTableViewController.students = sortedStudents
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //deal with the embed
        if segue.identifier == "Segue" {
            //we are trying to embedd the tableView inside the container
            //take our prop from up top
            studentsTableViewController = (segue.destination as! StudentsTableViewController) //ask for clarity
        }
    }
}
