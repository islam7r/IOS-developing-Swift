//
//  ViewController.swift
//  ObjectWithCode
//
//  Created by Islam Rzayev on 08.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    let myLabel = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let width = view.frame.size.width
        let height = view.frame.size.height
        
        
        myLabel.text = "My Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.5 - width * 0.8 / 2, y: height * 0.5 - 50 / 2, width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        let myButton = UIButton()
        myButton.setTitle("Click", for: UIControl.State.normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.frame = CGRect(x: width * 0.5 - 75, y: height * 0.6 - 25, width: 150, height: 50)
        view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(ViewController.myButtonAction), for: UIControl.Event.touchUpInside)
    }

    @objc func myButtonAction(){
        
        myLabel.text = "Congratulations"

    }

}

