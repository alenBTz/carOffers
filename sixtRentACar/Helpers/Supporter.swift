//
//  Supporter.swift
//  sixtRentACar
//
//  Created by Alen Basic on 9/26/17.
//  Copyright © 2017 alenbasic. All rights reserved.
//

import Foundation

public class Supporter {
    static let sharedInstance = Supporter()
    
    func getFuelType(letter: String) -> String{
        switch letter {
        case "D":
            return "Diesel"
        case "E":
            return "Electric"
        default:
            return "Petrol"
        }
    }
    
    func getTransmission(letter: String) -> String{
        switch letter {
        case "A":
            return "Automatic"
        default:
            return "Manual"
        }
    }
    
    func getImageUrlForCarSpecifications(modelIdentifier: String, color: String) -> String{
        let url = "https://prod.drive-now-content.com/fileadmin/user_upload_global/assets/cars/" + modelIdentifier + "/" + color + "/" + "2x/car.png"
        return url
    }
}

