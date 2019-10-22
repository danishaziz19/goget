//
//  Pods.swift
//  Goget
//
//  Created by Danish Aziz on 22/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

// MARK: - VehicleBooking
struct Pods: Codable {
    let pods: [Pod]
    
    enum CodingKeys: String, CodingKey {
        case pods = "pods"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.pods = try values.decode([Pod].self, forKey: .pods)
    }
}

// MARK: - Pod
struct Pod: Codable {
    let id: Int
    let name: String
    let description: String
    let lat: Double
    let lon: Double
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case description
        case lat, lon
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
        self.description = try values.decode(String.self, forKey: .description)
        self.lat = try values.decode(Double.self, forKey: .lat)
        self.lon = try values.decode(Double.self, forKey: .lon)
      
    }
}
