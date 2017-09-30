//
//  ViewController.swift
//  sixtRentACar
//
//  Created by Alen Basic on 9/25/17.
//  Copyright © 2017 alenbasic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var spinner: UIActivityIndicatorView!
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
        spinner.startAnimating()
        NetworkManager.sharedInstance.getCars(
            completionHandler: { (response, error) in
                if (error == nil){
                    DispatchQueue.main.async() {
                        self.spinner.stopAnimating()
                        self.saveCars(arrays: response!)
                    }
                } else {
                    AlertManager.sharedInstance.showAlert(message: Constants.AlertMessages.NoInternetConnection)
                }
        })
    }
    
    func saveCars(arrays: [[String: Any]]){
        for item in arrays{
            let car = SXCar()
            do {
                try car.initWithDictionary(dict: item)
                allCars.append(car)
            } catch let error {
                print(error)
            }
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
    
// MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Map", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vc.carLocation = allCars[indexPath.row].location
        vc.nameOfClient = allCars[indexPath.row].name
        self.show(vc, sender: nil)
    }
}

