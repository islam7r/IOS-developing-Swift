//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Islam Rzayev on 18.06.23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var movie: UILabel!
    
    @IBOutlet weak var poster: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func change_button(_ sender: Any) {
        poster.image = UIImage(named: "download")
    }
}

