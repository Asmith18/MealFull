//
//  FoodListTableViewController.swift
//  MealFull
//
//  Created by adam smith on 1/17/22.
//

import UIKit

class FoodListTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func addBtnPressed(_ sender: Any) {
    }
    
    func createFood() {
        guard let foodName = nameTextField.text,
                !foodName.isEmpty
        else { return }
        nameTextField.text = ""
        nameTextField.resignFirstResponder()
        FoodController.shared.creat(name: foodName)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return FoodController.shared.listOfFoods.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        
        
        let listOfFood = FoodController.shared.listOfFoods
        let foodForIndexPath = listOfFood[indexPath.row]
        cell.textLabel?.text = foodForIndexPath.name

        return cell
    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let indexPathRow = indexPath.row
            let sharedInstance = FoodController.shared
            let foodToDelete = sharedInstance.listOfFoods[indexPathRow]
            sharedInstance.delete(food: foodToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


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

// MARK: - UITableViewDelegate
extension FoodListTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        createFood()
        nameTextField.resignFirstResponder()
        return true
    }
}
