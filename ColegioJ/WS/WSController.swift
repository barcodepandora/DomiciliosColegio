//
//  WSController.swift
//  ColegioJ
//
//  Experto en ws
//
//  Created by Juan Manuel Moreno on 3/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//

import Foundation
import Reachability

public class WSController {
    
    var jsonUrl = NSURL()
    
    //  MARK: - Util
    
    /*
     * Consulta los colegios
     */
    func getForest() -> NSMutableDictionary {
        
        var forest = NSMutableDictionary()
        
        // Evaluamos conectividad con framework cocoapods Reachability
        let networkReachability: Reachability = Reachability.forInternetConnection()
        if !networkReachability.isReachable() {

            print("No internet connection")
        } else {

            jsonUrl = NSURL(string: "https://api.myjson.com/bins/10yg1t")!
            let request: NSURLRequest = NSURLRequest.init(url: jsonUrl as URL)
            var response: URLResponse?
            let _: NSError?
            do {

                let urlData = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response)
                let result: NSMutableDictionary = try JSONSerialization.jsonObject(with: urlData, options:JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableDictionary
                forest = result.mutableCopy() as! NSMutableDictionary
            } catch (let e) {

                print(e)
            }
        }
        return forest
    }
    
    /*
     * Consulta un colegio dado su json en la lista de colegios
     */
    func getSchoolLocation(pSchool: NSDictionary) -> NSMutableDictionary {
        
        var school = NSMutableDictionary()
        
        let networkReachability: Reachability = Reachability.forInternetConnection()
        if !networkReachability.isReachable() {
            
            print("No internet connection")
        } else {
            
            jsonUrl = NSURL(string: pSchool["stops_url"] as! String)!
            let request: NSURLRequest = NSURLRequest.init(url: jsonUrl as URL)
            var response: URLResponse?
            let _: NSError?
            do {
                
                let urlData = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response)
                let result: NSMutableDictionary = try JSONSerialization.jsonObject(with: urlData, options:JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableDictionary
                school = result.mutableCopy() as! NSMutableDictionary
            } catch (let e) {
                
                print(e)
            }
        }
        return school
    }
}
