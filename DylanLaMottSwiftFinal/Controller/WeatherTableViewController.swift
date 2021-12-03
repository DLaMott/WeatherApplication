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
    
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let detailVC = segue.destination as? WeatherDataViewController else {return}
        
        if let selectedIn = tableView.indexPathForSelectedRow?.row{
            detailVC.weatherData = weather[selectedIn]
            
            if let indexPath = tableView.indexPathForSelectedRow{
                tableView.deselectRow(at: indexPath, animated: true)
            }
            
        }
    }
    
    
    @IBAction func unwindToWeatherList(_ segue: UIStoryboardSegue) {
        let weatherAdd = segue.source as! WeatherAddViewController
        guard let weatherS = weatherAdd.weather else { return }
        
            if let indexPath = tableView.indexPathForSelectedRow {
                
                weather.remove(at: indexPath.row)
                weather.insert(weatherS, at: indexPath.startIndex)
                tableView.deselectRow(at: indexPath, animated: true)
        } else {
            weather.append(weatherS)
        }
        tableView.reloadData()
   }

}
