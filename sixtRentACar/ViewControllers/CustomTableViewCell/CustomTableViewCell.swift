//
//  CustomTableViewCell.swift
//  sixtRentACar
//
//  Created by Alen Basic on 9/26/17.
//  Copyright © 2017 alenbasic. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFuelType: UILabel!
    @IBOutlet weak var lblModelName: UILabel!
    @IBOutlet weak var imgCar: UIImageView!
    
//MARK: - Life Cycle
    
    override func awakeFromNib() {

        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//MARK: - Setup View
    
    func setupView(car: SXCar){
        self.lblModelName.text = car.make + " " + car.modelName
        self.lblFuelType.text = Supporter.sharedInstance.getFuelType(letter: car.fuelType) + ", " + "Transmission: " + Supporter.sharedInstance.getTransmission(letter: car.transmission)
        
        if let url = NSURL(string: Supporter.sharedInstance.getImageUrlForCarSpecifications(modelIdentifier: car.modelIdentifier, color: car.color)) {
            if let data = NSData(contentsOf: url as URL) {
                self.imgCar.image = UIImage(data: data as Data)
            }        
        }
    }
}
