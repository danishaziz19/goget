//
//  BookingDetailViewController.swift
//  Goget
//
//  Created by Danish Aziz on 22/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit

class BookingDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setDefault()
    }
    
    func setDefault() {
        self.title = "Bookings Details"
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
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
