//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Islam Rzayev on 13.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var BirthdayTextField: UITextField!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var BirthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting as? vs as!
        
        if let newName = storedName as? String{
            NameLabel.text = newName
        }
        
        if let newBirthday = storedBirthday as? String{
            BirthdayLabel.text = newBirthday
        }


    }

    @IBAction func SaveClicker(_ sender: Any) {
        
        
        UserDefaults.standard.set(NameTextField.text!, forKey: "name")
        UserDefaults.standard.set(BirthdayTextField.text!, forKey: "birthday")
        //UserDefaults.standard.synchronize()
        
        NameLabel.text = "Name: \(NameTextField.text!)"
        BirthdayLabel.text = "Birthday: \(BirthdayTextField.text!)"
        
    }
    @IBAction func deleteClicker(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
        }
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
        }


        
    }
    
}

