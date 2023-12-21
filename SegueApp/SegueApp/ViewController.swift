//
//  ViewController.swift
//  SegueApp
//
//  Created by Islam Rzayev on 14.08.23.
//

import UIKit

class ViewController: UIViewController {
    var userName = ""

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var FirstLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad function called")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear function called")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function called")
        nameText.text = ""
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function called")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear function called")
    }

    @IBAction func NextClicked(_ sender: Any) {
        userName = nameText.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
            //as -- casting
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.newName = userName
        }
    }
    
}

