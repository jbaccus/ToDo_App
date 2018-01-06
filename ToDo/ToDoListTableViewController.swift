//
//  ToDoListTableViewController.swift
//  ToDo
//
//  Created by Jaimie Baccus on 1/5/18.
//  Copyright © 2018 Jaimie Baccus. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toDos = createToDos()
    }

    func createToDos() ->  [ToDo] {
        let eggs = ToDo()
        eggs.name = "Buy Eggs"
        eggs.important = true
        
        let walkDog = ToDo()
        walkDog.name = "Walk the Dog"
        
        let cheese = ToDo()
        cheese.name = "Eat Cheese"
        
        return [eggs,walkDog,cheese]
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        let  toDo = toDos[indexPath.row]
        
        if toDo.important {
           cell.textLabel?.text = "❗️" + toDo.name
        } else {
            cell.textLabel?.text = toDo.name
        }
       
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addVC = segue.destination as! AddToDoViewController
        addVC.previousVC = self
    }
    
}
