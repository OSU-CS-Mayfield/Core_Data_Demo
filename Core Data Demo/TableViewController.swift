//
//  TableViewController.swift
//  Core Data Demo
//
//  Created by Blayne Mayfield on 2/15/22.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    var dataSource: [Course] = []
    
    var appDelegate: AppDelegate?
    var context: NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Fetch the database contents.
        do {
            dataSource = try context?.fetch(Course.fetchRequest()) ?? []
        }
        catch let error as NSError {
            print("Cannot load data: \(error)")
        }
    }
    
    @IBAction func unwindFromSave(segue: UIStoryboardSegue) {
        // Get the segue source.
        guard let source = segue.source as? ViewController else {
            print("Cannot get segue source.")
            return
        }
        
        // Create a new course record.
        let course = Course(context: context!)
        // Set the attributes in the new course record.
        course.deptAbbr = source.deptAbbrResult
        course.courseNum = source.courseNumResult
        course.title = source.courseTitleResult
        
        do {
            // Update the data store with the managed context.
            try context?.save()
            // Add this record to the table view data source.
            dataSource.append(course)
            // Reload the data in the table view.
            self.tableView.reloadData()
        }
        catch let error as NSError {
            print("Cannot save data: \(error)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "My Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = dataSource[indexPath[1]].deptAbbr! + String(dataSource[indexPath[1]].courseNum)
        cell.detailTextLabel?.text = dataSource[indexPath[1]].title

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
