//
//  Vehicles.swift
//  Goget
//
//  Created by Danish Aziz on 22/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

// MARK: - Vehicles
struct Vehicles: Codable {
    let vehicles: [Vehicle]
    
    enum CodingKeys: String, CodingKey {
        case vehicles = "Vehicles"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.vehicles = try values.decode([Vehicle].self, forKey: .vehicles)
    }
}

// MARK: - Vehicle
struct Vehicle: Codable {
    let id: Int
    let name, vehicleDescription, fuelType: String
    let capacity: Int
    let numberPlate: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case vehicleDescription = "description"
        case fuelType, capacity, numberPlate, image
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.fuelType = try values.decode(String.self, forKey: .fuelType)
        self.vehicleDescription = try values.decode(String.self, forKey: .vehicleDescription)
        self.capacity = try values.decode(Int.self, forKey: .capacity)
        self.numberPlate = try values.decode(String.self, forKey: .numberPlate)
        self.image = try values.decode(String.self, forKey: .image)
    }
}
