//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Islam Rzayev on 14.08.23.
//

import UIKit

class SecondViewController: UIViewController {
    

    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    
    var newName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameLabel.text = newName

    }
    

   

}
