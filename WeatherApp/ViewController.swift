//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mesut Aygün on 21.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonlabel: UIButton!
    @IBOutlet weak var cityLabel: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttonlabel.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        cityLabel.text = ""
    }

    @IBAction func buttonClicked(_ sender: Any) {
        let city = cityLabel.text ?? ""
        
        if city.isEmpty {
            let alert = UIAlertController(title: "ERROR", message: "PLEASE TRY AGAIN", preferredStyle: UIAlertController.Style.alert)
            let cancel = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }else{
            
            let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailVC
            vc.city = city
            
            self.show(vc, sender: nil)
        }
    
}

}

