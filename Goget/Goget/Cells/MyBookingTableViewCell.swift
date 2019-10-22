//
//  MyBookingTableViewCell.swift
//  Goget
//
//  Created by Danish Aziz on 22/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

class MyBookingTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Set Cell variable Values from VehicleBooking
    func setCell(vehicleBooking: VehicleBooking) {
        self.lblDate.text = vehicleBooking.startDate.elementsEqual(vehicleBooking.endDate) ? vehicleBooking.startDate : "\(vehicleBooking.startDate) - \(vehicleBooking.endDate)"
        self.lblTime.text = "\(vehicleBooking.startTime) - \(vehicleBooking.endTime)"
    }
}
