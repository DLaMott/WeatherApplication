//
//  WeatherAddViewController.swift
//  DylanLaMottSwiftFinal
//
//  Created by Dylan LaMott on 12/2/21.
//  Used to add cities to application

import UIKit

class WeatherAddViewController: UIViewController {
    
    var weather: Weather?
    var ifk = parseCSV()

    @IBOutlet var weatherTextField: UITextField!
    @IBOutlet var TempTextField: UITextField!
    @IBOutlet var CityTextField: UITextField!
    @IBOutlet var StateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateView(){
        if let weather = weather{
            weatherTextField.text = weather.weather
            TempTextField.text = weather.temp
            CityTextField.text = weather.city
            StateTextField.text = weather.state
        }
    }
    

    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard let state1 = StateTextField.text, let city1 = CityTextField.text, let temp1 = TempTextField.text, let weather1 = weatherTextField.text else {
            return
        }
        
        weather = Weather(state: state1, city: city1, temp: temp1, weather: weather1)
        performSegue(withIdentifier: "weatherList", sender: self)
        /*
         
        Todo: Read from file and write to allowing for better data saving
        var csvText = ""
        let newLine = "\(state1), \(city1), \(temp1), \(weather1)"
        var info1: [(String, String, String, String)] = []
        for info in ifk{
            info1.append(info)
        }
        
        csvText.append(newLine)
        
        do {
        try csvText.write(toFile: "/Users/dylanlamott/Documents/DylanLaMottSwiftFinal/DylanLaMottSwiftFinal/WeatherData.csv", atomically: true, encoding: String.Encoding.utf8)
        } catch {
                print("Failed to write file")
                print("\(error)")
            return
            }
        */
    }
    }

