//
//  CarModel.swift
//  sixtRentACar
//
//  Created by Alen Basic on 9/25/17.
//  Copyright © 2017 alenbasic. All rights reserved.
//

import Foundation
import CoreLocation

class SXCar: NSObject {
    var uuID = NSUUID().uuidString
    var id = ""
    var modelIdentifier = ""
    var modelName = ""
    var name = ""
    var make = ""
    var group = ""
    var color = ""
    var series = ""
    var fuelType = ""
    var fuelLevel = ""
    var transmission = ""
    var licensePlate = ""
    var location = CLLocation()
    var innerCleanliness = ""
    
//MARK: - Initializers
    
    func initWithDictionary(dict: NSDictionary){
        
        self.id = dict.object(forKey: "id") as! String
        self.modelIdentifier = dict.object(forKey: "modelIdentifier") as! String
        self.modelName = dict.object(forKey: "modelName") as! String
        self.make = dict.object(forKey: "make") as! String
        self.name = dict.object(forKey: "name") as! String
        self.group = dict.object(forKey: "group") as! String
        self.color = dict.object(forKey: "color") as! String
        self.series = dict.object(forKey: "series") as! String
        self.fuelType = dict.object(forKey: "fuelType") as! String
        self.transmission = dict.object(forKey: "transmission") as! String
        self.licensePlate = dict.object(forKey: "licensePlate") as! String
        self.location = CLLocation.init(latitude: dict.object(forKey: "latitude") as! CLLocationDegrees, longitude: dict.object(forKey: "longitude") as! CLLocationDegrees)
        self.innerCleanliness = dict.object(forKey: "innerCleanliness") as! String
    }
}
