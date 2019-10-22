//
//  BookingDetailViewController.swift
//  Goget
//
//  Created by Danish Aziz on 22/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

class BookingDetailViewController: UIViewController {

    @IBOutlet weak var lblLocationName: UILabel!
    @IBOutlet weak var lblLocationDescription: UILabel!
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var lblCarName: UILabel!
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var lblNumberPlate: UILabel!
    
    @IBOutlet weak var lblStartDate: UILabel!
    @IBOutlet weak var lblEndDate: UILabel!
    
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblEstimatedCost: UILabel!
    @IBOutlet weak var lblFuelPin: UILabel!
    
    let logicController: BookingDetailLogicController = BookingDetailLogicController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setDefault()
    }
    
    /// Set Default Setting
    func setDefault() {
        self.title = "Bookings Details"
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.logicController.delegate = self
        self.logicController.loadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK: Delegate Methods
extension BookingDetailViewController: BookingDetailLogicControllerDelegate {
    
    func VehicleBookingResponse(vehicleBooking: VehicleBooking) {
        self.lblStartDate.text = vehicleBooking.startFullDate
        self.lblEndDate.text = vehicleBooking.endFullDate
        self.lblDuration.text = "\(vehicleBooking.duration) hours"
        self.lblEstimatedCost.text = "$\(vehicleBooking.estimatedCost)"
        self.lblFuelPin.text = vehicleBooking.fuelPin
    }
   
    func VehicleResponse(vehicle: Vehicle) {
        self.lblCarName.text = vehicle.name
        self.lblCapacity.text = "\(vehicle.capacity)"
        self.lblNumberPlate.text = vehicle.numberPlate
        self.carImageView.downloaded(from: vehicle.image)
    }
    
    func PodResponse(pod: Pod) {
        self.lblLocationName.text = pod.name
        self.lblLocationDescription.text = pod.description
    }
}
