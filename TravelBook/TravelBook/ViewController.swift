//
//  ViewController.swift
//  TravelBook
//
//  Created by Islam Rzayev on 07.11.23.
//

import UIKit
import MapKit
import CoreData
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    var selectedNameText = ""
    var selectedId = UUID()
    
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLongitude = Double()
    var annotationLatidue = Double()
    
    override func viewDidLoad() {
        
        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chosenLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 3
        self.mapView.addGestureRecognizer(gestureRecognizer)
        
        
        if selectedNameText != ""{
            
            
           //Core Data
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            let idString = selectedId.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
                if results.count > 0{
                    for result in results as! [NSManagedObject]{
                        if let title = result.value(forKey: "title"){
                            annotationTitle = (title as? String)!
                            
                            if let subtitle = result.value(forKey: "subtitle"){
                                annotationSubtitle = (subtitle as? String)!
                                
                                if let longitude = result.value(forKey: "longitude"){
                                    annotationLongitude = longitude as! Double
                                    
                                    if let latitude = result.value(forKey: "latitude"){
                                        annotationLatidue = latitude as! Double
                                        
                                        let annotation = MKPointAnnotation()
                                        annotation.title = annotationTitle
                                        annotation.subtitle = annotationSubtitle
                                        let coordinate = CLLocationCoordinate2D(latitude: annotationLatidue, longitude: annotationLongitude)
                                        annotation.coordinate = coordinate
                                        
                                        mapView.addAnnotation(annotation)
                                        
                                        nameText.text = annotationTitle
                                        commentText.text = annotationSubtitle
                                        
                                        locationManager.stopUpdatingLocation()
                                        
                                        
                                        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                                        let region = MKCoordinateRegion(center: coordinate, span: span)
                                        mapView.setRegion(region, animated: true)
                                        
                                    }
                                }
                            }
                        }
                        
                        
                        
                        
                        
                        
                            
                        
                    }
                }
            }catch{
                
            }
            
            
            
            
            
        }
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func chosenLocation(gestureRecognizer:UILongPressGestureRecognizer){
        
           if gestureRecognizer.state == .began{
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let touchedCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
               chosenLatitude = touchedCoordinates.latitude
               chosenLongitude = touchedCoordinates.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
               annotation.title = nameText.text
               annotation.subtitle = commentText.text
            self.mapView.addAnnotation(annotation)
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if selectedNameText == ""{
            
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        
        let reuseId = "myAnnotation"
        var pinview = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinview == nil{
            pinview = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinview?.canShowCallout = true
            pinview?.tintColor = UIColor.black
            
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinview?.rightCalloutAccessoryView = button
        }else{
            pinview?.annotation = annotation
        }
        
        return pinview
        
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if selectedNameText != ""{
            let requestedLocation = CLLocation(latitude: annotationLatidue, longitude: annotationLongitude)
            
            CLGeocoder().reverseGeocodeLocation(requestedLocation) { (placemarks, error) in
                if let placemark = placemarks{
                    if placemark.count > 0{
                        
                        let newPlacemark = MKPlacemark(placemark: placemark[0])
                        let item = MKMapItem(placemark: newPlacemark)
                        item.name = self.annotationTitle
                        let launcOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                        item.openInMaps(launchOptions: launcOptions)
                        
                        
                    }
                }
            }
        }
    }


    @IBAction func saveButton(_ sender: Any) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(UUID(), forKey: "id")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        
        do{
            try context.save()
            print("success")
        }catch{
            print("error")
        }
        
        
        NotificationCenter.default.post(name: NSNotification.Name("newPlace"), object: nil)
        navigationController?.popViewController(animated: true)
        

        
    }
}

