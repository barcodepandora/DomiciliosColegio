//
//  ForestViewController.swift
//  ColegioJ
//
//  Created by Juan Manuel Moreno on 2/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//

import UIKit

class ForestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tForest: UITableView!
    
    var forest: NSMutableDictionary = [:]
    var schools: NSMutableArray = []
    
    // MARK: - Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return schools.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "School") as? SchoolTableViewCell!
        
        if schools.count > 0 {

            let school: NSDictionary = schools[indexPath.row] as! NSMutableDictionary
            let name = school["description"] as! String
            print("El colegio es " + name)
            cell!.bName.setTitle(name, for: .normal)
            cell!.bName.tag = indexPath.row
        }

        return cell!

    }
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tForest.delegate = self
        self.tForest.dataSource = self
        
        let wsController = WSController()
        forest = wsController.getForest()
        if let s = forest["school_buses"] {
            if (s as AnyObject).count > 0 {
                schools = forest["school_buses"] as! NSMutableArray
            }
        } else {
            schools = NSMutableArray()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choose(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SchoolViewController") as! SchoolViewController
        self.present(controller, animated: true, completion: nil)
        
        let school: NSDictionary = schools[(sender as! UIButton).tag] as! NSMutableDictionary
        controller.school = school
        controller.show()
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
