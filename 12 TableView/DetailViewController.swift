//
//  DetailViewController.swift
//  12 TableView
//
//  Created by Gukhwa Jeon on 12.05.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var receiveItem = ""

    @IBOutlet var lblItem: UILabel!

    override func viewDidLoad() {
        print("DetailViewController.viewDidLoad()")
        super.viewDidLoad()

        lblItem.text = receiveItem
    }

    func receiveItem(_ item: String) {
        receiveItem = item
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
