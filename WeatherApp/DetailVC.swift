//
//  DetailVC.swift
//  WeatherApp
//
//  Created by Mesut Aygün on 21.04.2021.
//

import UIKit

class DetailVC: UIViewController {
var city = String()
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        cityNameLabel.text = city
        getTodayResult(cityNameLabel: city)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    func getTodayResult(cityNameLabel : String) {
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityNameLabel)&appid=0f6112b1d663b03202ffabe9788c51ef") {
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request){(data,response,error) in
                if error == nil {
                    if let incomingData = data {
                        do{
                            let json = try JSONSerialization.jsonObject(with: incomingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            //print(json)
                            if let main = json["main"] as? NSDictionary {
                              if  let temp = main["temp"] as? Double {
                                let state = Int(temp - 273.15)
                                DispatchQueue.main.sync {
                                    self.weatherLabel.text = String(state)
                                }
                                }
                            }
                        }catch{
                            print("hata!!")
                        }
                    }
                }
            }
            task.resume()
        }
        
        
    }
    

   

}
