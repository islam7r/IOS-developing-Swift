//
//  DetailsVC.swift
//  LandMarkBook2ndTry
//
//  Created by Islam Rzayev on 19.10.23.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landMarkName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandMarkName = ""
    var selectedLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        landMarkName.text = selectedLandMarkName
        imageView.image = selectedLandMarkImage
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
