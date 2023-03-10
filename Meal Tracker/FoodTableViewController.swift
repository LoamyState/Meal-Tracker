//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Jane Madsen on 3/7/23.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        var breakfast = Meal(name: "Breakfast", food: [
            Food(name: "Toast", description: "Bread from a toaster"),
            Food(name: "OJ", description: "Juice squeezed from an orange"),
            Food(name: "Just Egg", description: "Vegan egg scramble")])
        var lunch = Meal(name: "Lunch", food: [
            Food(name: "Sandwich", description: "Some food between some slices of bread for easy hoisting"),
            Food(name: "Soda", description: "Unhealthy but tasty soft drink"),
            Food(name: "Chips", description: "You're at Subway, who are you trying to impress with those baked Lays")
        ])
        var dinner = Meal(name: "Dinner", food: [
            Food(name: "Chili", description: "Heaping bowl of beans and vegetables"),
            Food(name: "Sourdough", description: "Perfect bread for dipping in your chili"),
            Food(name: "Beer", description: "Perfect companion to a heaping bowl of chili")
        ])
        
        return [breakfast, lunch, dinner]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]

        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        content.secondaryText = food.description
        cell.contentConfiguration = content

        return cell
    }
 
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let meal = meals[section]
        return meal.name
    }
}
