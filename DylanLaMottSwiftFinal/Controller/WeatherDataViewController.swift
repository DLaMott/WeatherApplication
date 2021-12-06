//
//  WeatherDataViewController.swift
//  DylanLaMottSwiftFinal
//
//  Created by Dylan LaMott on 11/30/21.
//

import UIKit
import SpriteKit
import SwiftUI


class WeatherDataViewController: UIViewController {
    
    // Outlet for view
    @IBOutlet var weatherView: UIView!
    
    // Variable for acessing weather data
    var weatherData: Weather!
    
    // Create pariticles for weather formats
    // Rain
    let emitterNode = SKEmitterNode(fileNamed: "Rain.sks")!
    // Snow
    let emitterNode2 = SKEmitterNode(fileNamed: "Snow.sks")!

    
    // Outlets for labels and images
    @IBOutlet var currentDate: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    
    func updateView(){
        
        // Label text set to data in weather array
        stateLabel.text = weatherData.state
        cityLabel.text = weatherData.city
        tempLabel.text = weatherData.temp
        weatherLabel.text = weatherData.weather
        
        
        // Get Current Date
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
    
        let exactTime: Date = Date()
        // Set Label text to current date
        currentDate.text = dateFormatterPrint.string(from: exactTime)
        
        
        if weatherData.weather.lowercased() == "rain"{
            weatherImage.image = UIImage(named: "rain")
            weatherView.backgroundColor = UIColor(.gray)
            addRain()
        }
        if weatherData.weather.lowercased() == "sunny"{
            weatherImage.image = UIImage(named: "sun")
        }
        if weatherData.weather.lowercased() == "cloudy"{
            weatherImage.image = UIImage(named: "cloudy")
            weatherView.backgroundColor = UIColor(.gray)
            
        }
        if weatherData.weather.lowercased() == "thunderstorms"{
            weatherImage.image = UIImage(named: "rainthunder")
            weatherView.backgroundColor = UIColor(.gray)
            addRain()
            
        }
        if weatherData.weather.lowercased() == "snow"{
            weatherImage.image = UIImage(named: "snow")
            weatherView.backgroundColor = UIColor(.gray)
            addSnow()
        }
    
    }
    
    // Function to add rain sprite
    private func addRain() {
        
            // Load a view and set options/position
            let skView = SKView(frame: view.frame)
            skView.backgroundColor = .clear
            let scene = SKScene(size: view.frame.size)
            scene.backgroundColor = .clear
            skView.presentScene(scene)
            skView.isUserInteractionEnabled = false
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            // Add sprite file to the scene
            scene.addChild(emitterNode)
            emitterNode.position.y = scene.frame.maxY
            emitterNode.particlePositionRange.dx = scene.frame.width
            view.addSubview(skView)
        }
    // Function to add snow sprite
    private func addSnow(){
        // Load a view and set options/position
        let skView = SKView(frame: view.frame)
        skView.backgroundColor = .clear
        let scene = SKScene(size: view.frame.size)
        scene.backgroundColor = .clear
        skView.presentScene(scene)
        skView.isUserInteractionEnabled = false
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        // Add sprite file to the scene
        scene.addChild(emitterNode2)
        emitterNode2.position.y = scene.frame.maxY
        emitterNode2.particlePositionRange.dx = scene.frame.width
        view.addSubview(skView)
    }
}

