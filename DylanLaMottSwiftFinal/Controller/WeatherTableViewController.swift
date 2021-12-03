//
//  WeatherTableViewController.swift
//  DylanLaMottSwiftFinal
//
//  Created by Dylan LaMott on 11/30/21.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    //
    var weather:[Weather] = parseCSV()

    override func viewDidLoad() {
        super.viewDidLoad()
       

         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return weather.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = weather[indexPath.row].state
        cell.detailTextLabel?.text = weather[indexPath.row].city

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(weather[indexPath.row])
        self.performSegue(withIdentifier: "showDetail", sender: tableView)
        
    }
    
    // For Tableview row deletion
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
        {
            // Return `false` if you do not want the
            //  specified item to be editable.
            return true
        }
        // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
        {
            if editingStyle == .delete {
                // Delete the row from the data source
                weather.remove(at: indexPath.row)
                // Then, delete the row from the table itself
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? WeatherDataViewController else {return}
        
        if let selectedIn = tableView.indexPathForSelectedRow?.row{
            detailVC.weatherData = weather[selectedIn]
            
            if let indexPath = tableView.indexPathForSelectedRow{
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
        }
    }
    
    // Unwind to tableview
    @IBAction func unwindToWeatherList(_ segue: UIStoryboardSegue) {
        
        // Add source from viewcontroller
        let weatherAdd = segue.source as! WeatherAddViewController
        guard let weatherS = weatherAdd.weather else { return }
            // For row
            if let indexPath = tableView.indexPathForSelectedRow {
                // Remove position
                weather.remove(at: indexPath.row)
                // Insert new information at last index
                weather.insert(weatherS, at: indexPath.startIndex)
                // Deselect row animation
                //tableView.deselectRow(at: indexPath, animated: true)
        } else {
            weather.append(weatherS)
        }
        // Reload tableview
        tableView.reloadData()
   }

}
