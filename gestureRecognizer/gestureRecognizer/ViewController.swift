//
//  ViewController.swift
//  gestureRecognizer
//
//  Created by Islam Rzayev on 08.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var isAriKapi = true

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changePic(){
        if(isAriKapi == true){
            imageView.image = UIImage(named: "kutuphane")
            myLabel.text = "Kutuphane"
            isAriKapi = false
        }else{
            imageView.image = UIImage(named: "anakampus480x313")
            myLabel.text = "Ari Kapi"
            isAriKapi = true
        }
    }
    
    
}
