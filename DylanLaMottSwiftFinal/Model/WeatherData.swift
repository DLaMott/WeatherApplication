//
//  WeatherData.swift
//  DylanLaMottSwiftFinal
//
//  Created by Dylan LaMott on 11/30/21.
//

// Added to practice reading to and from files in swift
// This seemed complex and I wanted to do this on my own
//To Do: Use a database instead of a file

import Foundation

func openCSV(fileName:String, fileType: String)-> String!{
    guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
        else {
            return nil
    }
    do {
        let contents = try String(contentsOfFile: filepath, encoding: .utf8)

        return contents
    } catch {
        print("File Read Error for file \(filepath)")
        return nil
    }
}

func parseCSV() -> [Weather]{
    // Var storing data from csv file
    let dataString: String! = openCSV(fileName: "WeatherData", fileType: "csv")
    //Create tuple array to hold data for parsing
    var info: [(String, String, String, String)] = []
    let sepLines: [String] = dataString.components(separatedBy: NSCharacterSet.newlines) as [String]
    var allData = [Weather]()
    
    for lines in sepLines{
        var values:[String] = []
        if lines != ""{
            if lines.range(of: "\"") != nil{
                var textToScan: String = lines
                var value: String?
                var textScanner:Scanner = Scanner(string: textToScan)
                while !textScanner.isAtEnd {
                    if (textScanner.string as NSString).substring(to: 1) == "\"" {


                        textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)

                        value = textScanner.scanUpToString("\"")
                        textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)
                    } else {
                        value = textScanner.scanUpToString(",")
                    }

                     values.append(value! as String)

                 if !textScanner.isAtEnd{
                         let indexPlusOne = textScanner.string.index(after: textScanner.currentIndex)

                     textToScan = String(textScanner.string[indexPlusOne...])
                     } else {
                         textToScan = ""
                     }
                     textScanner = Scanner(string: textToScan)
                }
                
            }else{
                values = lines.components(separatedBy: ",")
            }
            
            let item = (values[0], values[1], values[2], values[3])
            info.append(item)
            
            let data = Weather(state: item.0, city: item.1, temp: item.2, weather: item.3)
            
            allData.append(data)
        }
    }
    return allData
}


