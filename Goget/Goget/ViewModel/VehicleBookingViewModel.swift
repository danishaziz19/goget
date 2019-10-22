//
//  VehicleBookingViewModel.swift
//  Goget
//
//  Created by Danish Aziz on 22/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

enum ViewModelResponse<T> {
    case success(T)
    case error(String)
}

class VehicleBookingViewModel: NSObject {
    
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
    
    func getVehicle(vehicleId: Int, response: @escaping (_ vehicleBookings: ViewModelResponse<Vehicle?>) -> ()) {
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
    
    func getPod(podId: Int, response: @escaping (_ vehicleBookings: ViewModelResponse<Pod?>) -> ()) {
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
