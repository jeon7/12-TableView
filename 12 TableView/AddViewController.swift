//
//  AddViewController.swift
//  12 TableView
//
//  Created by Gukhwa Jeon on 12.05.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        print("AddViewController.viewDidLoad()")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        print("AddViewController.btnAddItem(sender:)")
        items.append(tfAddItem.text!) // 전역변수라 그냥 접근 가능
        itemsImageFile.append("clock.png")
        
        dump(items)
        dump(itemsImageFile)
        tfAddItem.text = ""
        
        // 루트 뷰 컨트롤러로 돌아감
        _ = navigationController?.popViewController(animated: true)
        
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
