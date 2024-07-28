//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = [
                Items(nameTitle: "hi", body: true),
                Items(nameTitle: "what your name", body: true),
                Items(nameTitle: "i dont no", body: true)
                
    ]
    let defaults = UserDefaults.standard// sử dụng để lưu dữ liệu cục bộ
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        if let item = defaults.array(forKey: "TodoListArray") as? [String]{
            itemArray = item
        }
    }
    // MASK - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    // MASK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)// hien mau xam len rồi biến mất
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            //what will happen once the user on click the Add Item on our alert
            if let safeText = textField.text{
                self.itemArray.append(safeText)
                self.defaults.set(self.itemArray, forKey: "TodoListArray")
                self.tableView.reloadData()
            }
            
        }
        alert.addTextField{alertTextFile in
            alertTextFile.placeholder = "Create new item"
            textField = alertTextFile
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

