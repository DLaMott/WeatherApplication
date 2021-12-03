//
//  WeatherAddViewController.swift
//  DylanLaMottSwiftFinal
//
//  Created by Dylan LaMott on 12/2/21.
//

import UIKit

class WeatherAddViewController: UIViewController {
    
    var weather: Weather?

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
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
