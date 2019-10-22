//
//  VehicleBookingViewModel.swift
//  Goget
//
//  Created by Danish Aziz on 22/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

/// Generic ViewModel Response 
enum ViewModelResponse<T> {
    case success(T)
    case error(String)
}

class VehicleBookingViewModel: NSObject {
    
    /// Get VehicleBookings
    ///
    /// get VehicleBooking Data from file and decode Json format to VehicleBookings Class
    func getVehicleBookings(response: @escaping (_ vehicleBookings: ViewModelResponse<VehicleBookings?>) -> ()) {
        guard let filepath = Bundle.main.url(forResource: "vehicleBookings", withExtension: "json")
            else {
                response(.error("wrong path"))
                return
        }
        do {
            let data = try Data(contentsOf: filepath)
            if let vehicleBooking = try? JSONDecoder().decode(VehicleBookings.self, from: data) {
                response(.success(vehicleBooking))
            }
        } catch {
            response(.error(error.localizedDescription))
        }
    }
    
    /// Get Vehicle
    ///
    /// get Vehicle Data from file and decode Json format to Vehicle Class
    func getVehicle(vehicleId: Int, response: @escaping (_ vehicle: ViewModelResponse<Vehicle?>) -> ()) {
        guard let filepath = Bundle.main.url(forResource: "vehicles", withExtension: "json")
            else {
                response(.error("wrong path"))
                return
        }
        do {
            let data = try Data(contentsOf: filepath)
            if let vehicles = try? JSONDecoder().decode(Vehicles.self, from: data) {
                if let vehile = vehicles.vehicles.first(where: { $0.id == vehicleId }) {
                    response(.success(vehile))
                }
            }
        } catch {
            response(.error(error.localizedDescription))
        }
    }
    
    /// Get Pod
    ///
    /// get Pod Data from file and decode Json format to Pod Class
    func getPod(podId: Int, response: @escaping (_ pod: ViewModelResponse<Pod?>) -> ()) {
        guard let filepath = Bundle.main.url(forResource: "pods", withExtension: "json")
            else {
                response(.error("wrong path"))
                return
        }
        do {
            let data = try Data(contentsOf: filepath)
            if let pods = try? JSONDecoder().decode(Pods.self, from: data) {
                if let pod = pods.pods.first(where: { $0.id == podId }) {
                    response(.success(pod))
                }
            }
        } catch {
            response(.error(error.localizedDescription))
        }
    }
}
