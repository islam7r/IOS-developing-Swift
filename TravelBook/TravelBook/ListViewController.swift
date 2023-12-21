//
//  ListViewController.swift
//  TravelBook
//
//  Created by Islam Rzayev on 10.11.23.
//

import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var placeTitleArray = [String]()
    var placeIdArray = [UUID]()
    
    var chosenNameText = ""
    var chosenId = UUID()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
        
        
       
        
        getData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name("newPlace"), object: nil)
    }
    
    
    
    @objc func getData(){
        
        self.placeIdArray.removeAll(keepingCapacity: false)
        self.placeTitleArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let title = result.value(forKey: "title") as? String{
                        placeTitleArray.append(title)
                    }
                    if let id = result.value(forKey: "id") as? UUID{
                        placeIdArray.append(id)
                    }
                }
            }
            tableView.reloadData()
            
             
            
        }catch{
            print("erro")
        }
        
        
    }
    
    
    @objc func addButtonClicked(){
        chosenNameText = ""
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = placeTitleArray[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenId = placeIdArray[indexPath.row]
        chosenNameText = placeTitleArray[indexPath.row]
        performSegue(withIdentifier: "toViewController", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewController" {
           let destinationVC = segue.destination as! ViewController
            destinationVC.selectedNameText = chosenNameText
            destinationVC.selectedId = chosenId
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
