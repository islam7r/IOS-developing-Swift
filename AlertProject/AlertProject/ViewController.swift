//
//  ViewController.swift
//  AlertProject
//
//  Created by Islam Rzayev on 16.09.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordAgainText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        /*
         let alert = UIAlertController(title: "Error", message: "Wrong username", preferredStyle: UIAlertController.Style.alert);
         let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
         alert.addAction(okButton)
         self.present(alert, animated: true)
         */
        
        if usernameText.text == ""{
           makeAlert(titleInput: "Error", messageInput: "Username not found")
        } else if passwordText.text == ""{
            makeAlert(titleInput: "Error", messageInput: "Password not found")
        } else if passwordAgainText.text != passwordText.text{
            makeAlert(titleInput: "Error", messageInput: "Passwords do not match")
        } else{
            makeAlert(titleInput: "Success", messageInput: "You signed up successfully")
        }
        
        
    }
    func makeAlert(titleInput: String, messageInput: String) {
                let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert);
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }
}
