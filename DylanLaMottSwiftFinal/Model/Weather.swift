//
//  Weather.swift
//  DylanLaMottSwiftFinal
//
//  Created by Dylan LaMott on 11/30/21.
//

import Foundation

struct Weather{
    
    var state: String
    var city: String
    var temp: String
    var weather: String
    
    var description: String {
        return "State:\(state) City:\(city) temp: \(temp) condition: \(weather)"
    }
}
