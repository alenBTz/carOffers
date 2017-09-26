//
//  ViewController.swift
//  sixtRentACar
//
//  Created by Alen Basic on 9/25/17.
//  Copyright © 2017 alenbasic. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var allCars : [SXCar] = []
    
// MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        loadCars()
    }

// MARK: - Setup view
    
    func setupView(){
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
// MARK: - Data handling
    
    func loadCars(){
        NetworkManager.sharedInstance.getCars(
            completionHandler: { (response, error) in
                if (error == nil){
                    DispatchQueue.main.async() {
                        self.saveCars(dataArray: response!)
                    }
                } else {
                    AlertManager.sharedInstance.showAlert(message: Constants.AlertMessages.NoInternetConnection)
                }
        })
    }
    
    func saveCars(dataArray: NSArray){
        for item in dataArray{
            let car = SXCar()
            car.initWithDictionary(dict: item as! NSDictionary)
            allCars.append(car)
        }
        tableView.reloadData()
    }
    
// MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        cell.setupView(car: allCars[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.LabelText.TableSectionTitle
    }
    
// MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Map", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vc.carLocation = allCars[indexPath.row].location
        vc.nameOfClient = allCars[indexPath.row].name
        self.show(vc, sender: nil)
    }
}

