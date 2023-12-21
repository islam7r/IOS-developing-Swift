//
//  ViewController.swift
//  LandMarkBook2ndTry
//
//  Created by Islam Rzayev on 19.10.23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var landMarkNames =  [String]()
    var landMarkImages = [UIImage]()
    
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        landMarkNames.append("ADA")
        landMarkNames.append("ITU")
        landMarkNames.append("BOGAZICI")
        landMarkNames.append("METU")
        landMarkNames.append("YTU")
        
        landMarkImages.append(UIImage(named: "ada")!)
        landMarkImages.append(UIImage(named: "anakampus480x313")!)
        landMarkImages.append(UIImage(named: "bogazici")!)
        landMarkImages.append(UIImage(named: "metu")!)
        landMarkImages.append(UIImage(named: "ytu")!)
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell()
        //cell.textLabel?.text = "test" //ESKI USUL!!!
        var content = cell.defaultContentConfiguration()
        content.text = landMarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandMarkName = landMarkNames[indexPath.row]
        chosenLandMarkImage = landMarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toDetailsVC"){
            
            let destinationVC = segue.destination as? DetailsVC
            destinationVC?.selectedLandMarkImage = chosenLandMarkImage
            destinationVC?.selectedLandMarkName = chosenLandMarkName
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            self.landMarkNames.remove(at: indexPath.row)
            self.landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }



}

