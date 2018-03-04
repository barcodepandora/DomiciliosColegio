//
//  SchoolViewController.swift
//  ColegioJ
//
//  Created by Juan Manuel Moreno on 2/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//

import UIKit
import MapKit

class SchoolViewController: UIViewController {

    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    // MARK: - Back
    
    @IBAction func back(_ sender: Any) {
    
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    var school: NSDictionary = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func show() {
        
        lName.text = school["description"] as? String
        
        let wsController = WSController()
        let school4Show = wsController.getSchoolLocation(pSchool: school)

        map.mapType = MKMapType.standard
        
        if let l = school4Show["stops"] {
            if (l as AnyObject).count > 0 {
                
                var location = CLLocationCoordinate2D()
                let stops = school4Show["stops"] as! NSMutableArray
                let span = MKCoordinateSpanMake(0.05, 0.05)
                var region = MKCoordinateRegion()
                var annotation = MKPointAnnotation()
                
                for stop in stops {
                
                    location = CLLocationCoordinate2D(latitude: (stop as! NSDictionary)["lat"] as! Double, longitude: (stop as! NSDictionary)["lng"] as! Double)
                    region = MKCoordinateRegion(center: location, span: span)
                    map.setRegion(region, animated: true)
                    annotation = MKPointAnnotation()
                    annotation.coordinate = location
                    annotation.title = "Mi colegio"
                    annotation.subtitle = "Es aqui"
                    map.addAnnotation(annotation)

                }
            }
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
