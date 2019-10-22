//
//  BookingDetailLogicController.swift
//  Goget
//
//  Created by Danish Aziz on 23/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

protocol BookingDetailLogicControllerDelegate {
    func VehicleBookingResponse(vehicleBooking: VehicleBooking)
    func VehicleResponse(vehicle: Vehicle)
    func PodResponse(pod: Pod)
}

class BookingDetailLogicController: NSObject {

    let viewModel: VehicleBookingViewModel = VehicleBookingViewModel()
    var vehicleBooking: VehicleBooking?
    var vehicle: Vehicle?
    var pod: Pod?
    var delegate: BookingDetailLogicControllerDelegate?
    
    /// get vehicle and pod data from local file
    func loadData() {
        
        if let vehicleBooking = vehicleBooking {
            self.delegate?.VehicleBookingResponse(vehicleBooking: vehicleBooking)
        }
        
        self.getVehicle()
        self.getPod()
    }
    
    /// Get Vehicle
    ///
    /// get Vehicle from file and set to local Vehicle variable
    func getVehicle() {
        if let vehicleId = vehicleBooking?.vehicleID {
            self.viewModel.getVehicle(vehicleId: vehicleId) { [weak self] response in
                switch response {
                case .success(let vehicle):
                    guard let vehicle = vehicle else { return }
                    self?.vehicle = vehicle
                    self?.delegate?.VehicleResponse(vehicle: vehicle)
                case .error(let error):
                    print(error)
                }
            }
        }
    }
    
    /// Get Pod
    ///
    /// get Pod from file and set to local Pod variable
    func getPod() {
        if let podID = vehicleBooking?.podID {
            self.viewModel.getPod(podId: podID) { [weak self] response in
                switch response {
                case .success(let pod):
                    guard let pod = pod else { return }
                    self?.pod = pod
                    self?.delegate?.PodResponse(pod: pod)
                case .error(let error):
                    print(error)
                }
            }
        }
    }
}
