//
//  VehicleBookings.swift
//  Goget
//
//  Created by Danish Aziz on 22/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

// MARK: - Vehicles
struct VehicleBookings: Codable {
    let vehicleBookings: [VehicleBooking]
    
    enum CodingKeys: String, CodingKey {
        case vehicleBookings = "vehicleBookings"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.vehicleBookings = try values.decode([VehicleBooking].self, forKey: .vehicleBookings)
    }
}

// MARK: - VehicleBooking
struct VehicleBooking: Codable {
    let id: Int
    let startTime, endTime: String
    let vehicleID, podID: Int
    let estimatedCost: Double
    let fuelPin: String
    let freeKmsTotal: Int
    
    var startDate: String = ""
    var endDate: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id, startTime, endTime
        case vehicleID = "vehicleId"
        case podID = "podId"
        case estimatedCost, fuelPin, freeKmsTotal
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        var timeString = try values.decode(String.self, forKey: .startTime)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let dateFromString = dateFormatter.date(from: timeString) {
            dateFormatter.dateFormat = "EEE d MMM"
            self.startDate = dateFormatter.string(from: dateFromString)
            dateFormatter.dateFormat = "h:mm a"
            dateFormatter.locale = .current
            self.startTime = dateFormatter.string(from: dateFromString)
        } else {
            self.startTime = ""
        }
        
        timeString = try values.decode(String.self, forKey: .endTime)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let dateFromString = dateFormatter.date(from: timeString) {
            dateFormatter.dateFormat = "EEE d MMM"
            self.endDate = dateFormatter.string(from: dateFromString)
            dateFormatter.dateFormat = "h:mm a"
            dateFormatter.locale = .current
            self.endTime = dateFormatter.string(from: dateFromString)
        } else {
            self.endTime = ""
        }
        
        self.vehicleID = try values.decode(Int.self, forKey: .vehicleID)
        self.podID = try values.decode(Int.self, forKey: .podID)
        self.estimatedCost = try values.decode(Double.self, forKey: .estimatedCost)
        self.fuelPin = try values.decode(String.self, forKey: .fuelPin)
        self.freeKmsTotal = try values.decode(Int.self, forKey: .freeKmsTotal)
    }
}
