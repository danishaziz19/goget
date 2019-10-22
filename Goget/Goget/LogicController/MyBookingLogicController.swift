//
//  MyBookingLogicController.swift
//  Goget
//
//  Created by Danish Aziz on 22/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

enum MyBookingCellType: String{
    case myBookingCell = "myBookingCell"
}

protocol MyBookingLogicControllerDelegate {
    func didSelectCell(vehicleBooking: VehicleBooking)
}

class MyBookingLogicController: NSObject {

    let viewModel: VehicleBookingViewModel = VehicleBookingViewModel()
    var vehicleBookings: [VehicleBooking] = []
    var tableView: UITableView?
    var delegate: MyBookingLogicControllerDelegate?
    
    /// Set TableView
    ///
    /// - set tableview delegate, dataSource and register cell
    func setupTableView(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.separatorStyle = .none
        self.registerCell()
        self.getVehicleBookings()
    }
    
    /// register tableview cell
    func registerCell() {
        self.tableView?.register(UINib (nibName: "MyBookingTableViewCell", bundle: nil), forCellReuseIdentifier: MyBookingCellType.myBookingCell.rawValue)
    }
    
    /// Get VehicleBookings
    ///
    /// get VehicleBooking from file and set to local VehicleBooking variable
    func getVehicleBookings() {
        self.viewModel.getVehicleBookings() {[weak self] response in
            switch response {
            case .success(let vehicleBookings):
                guard let vehicleBookings = vehicleBookings else { return }
                self?.vehicleBookings = vehicleBookings.vehicleBookings
                DispatchQueue.main.async {
                    self?.reload()
                }
            case .error(let error):
                print(error)
            }
        }
    }
    
    /// reload tableview
    func reload() {
        self.tableView?.reloadData()
    }
    
    /// Get CellForRowAt
    ///
    /// - Parameter : Return UITableViewCell
    func getCellForRowAt(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let vehicleBooking = self.vehicleBookings[indexPath.row]
        guard let cell: MyBookingTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyBookingCellType.myBookingCell.rawValue) as? MyBookingTableViewCell else {
            return UITableViewCell()
        }
        cell.setCell(vehicleBooking: vehicleBooking)
        return cell
    }
}

// MARK: TableView Delegate and Data Source
extension MyBookingLogicController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vehicleBookings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.getCellForRowAt(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vehicleBooking = self.vehicleBookings[indexPath.row]
        self.delegate?.didSelectCell(vehicleBooking: vehicleBooking)
    }
}
