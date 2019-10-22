//
//  MyBookingViewController.swift
//  Goget
//
//  Created by Danish Aziz on 22/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

class MyBookingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let logicController: MyBookingLogicController = MyBookingLogicController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setDefault()
    }
    
    func setDefault() {
        self.title = "My Bookings"
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.logicController.setupTableView(tableView: self.tableView)
        self.logicController.delegate = self
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
extension MyBookingViewController: MyBookingLogicControllerDelegate {
    
    func didSelectCell(vehicleBooking: VehicleBooking) {
        if let bookingDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "bookingDetailViewController") as? BookingDetailViewController {
           // bookingDetailViewController.logicController.article = article
            self.navigationController?.pushViewController(bookingDetailViewController, animated: true)
        }
    }
}
