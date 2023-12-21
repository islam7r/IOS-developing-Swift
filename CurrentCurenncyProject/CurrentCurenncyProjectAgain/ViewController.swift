//
//  ViewController.swift
//  CurrentCurenncyProjectAgain
//
//  Created by Islam Rzayev on 11.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var aznLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRateClicked(_ sender: Any) {
        
        
        // 1) Request & Session
        // 2) Response & Data
        // 3) Parsing & JSON Serialization
        
        
        // 1) Request & Session
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=6451bdf64c3bf3475a57b70122bbfb9a")!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }else{
                
        // 2) Response & Data
                
                if data != nil{
                    
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC
                        
                        DispatchQueue.main.async {
                            
                            
                            if let rates = jsonResponse["rates"] as? [String : Any]{
                                
                                if let azn = rates["AZN"] as? Double{
                                    self.aznLabel.text = "AZN: \(azn)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let trY = rates["TRY"] as? Double{
                                    self.tryLabel.text = "TRY: \(trY)"
                                }
                                if let gbp = rates["GBP"] as? Double{
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double{
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                
                            }
                            
                        }
                        
                    }catch{
                        
                        DispatchQueue.main.async {
                            print("Error")
                        }
                        
                    }
                    
                }
            }
            
        }
        
        task.resume()
    }
    
}

