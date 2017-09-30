//
//  CarModel.swift
//  sixtRentACar
//
//  Created by Alen Basic on 9/25/17.
//  Copyright © 2017 alenbasic. All rights reserved.
//

import Foundation
import CoreLocation

enum SerializationError: Error{
    case missing(String)
}

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
    
    func initWithDictionary(dict: [String: Any]) throws{
        guard let sxId = dict["id"] as? String,
            let sxModelIdentifier = dict["modelIdentifier"] as? String,
            let sxModelName = dict["modelName"] as? String,
            let sxMake = dict["make"] as? String,
            let sxName = dict["name"] as? String,
            let sxGroup = dict["group"] as? String,
            let sxColor = dict["color"] as? String,
            let sxSeries = dict["series"] as? String,
            let sxFuelType = dict["fuelType"] as? String,
            let sxTransmission = dict["transmission"] as? String,
            let sxLicensePlate = dict["licensePlate"] as? String,
            let sxLatitude = dict["latitude"] as? CLLocationDegrees,
            let sxLongitude = dict["longitude"] as? CLLocationDegrees,
            let sxInnerCleanliness = dict["innerCleanliness"] as? String else{
                throw SerializationError.missing("Parameters")
        }
            
            
        self.id = sxId
        self.modelIdentifier = sxModelIdentifier
        self.modelName = sxModelName
        self.make = sxMake
        self.name = sxName
        self.group = sxGroup
        self.color = sxColor
        self.series = sxSeries
        self.fuelType = sxFuelType
        self.transmission = sxTransmission
        self.licensePlate = sxLicensePlate
        self.location = CLLocation.init(latitude: sxLatitude, longitude: sxLongitude)
        self.innerCleanliness = sxInnerCleanliness
    }
}
