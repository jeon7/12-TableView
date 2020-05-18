//
//  AddViewController.swift
//  12 TableView
//
//  Created by Gukhwa Jeon on 12.05.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var myPickerView: UIPickerView!
    @IBOutlet var imageViewFromPickerView: UIImageView!
    @IBOutlet var tfAddItem: UITextField!
    
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT: CGFloat = 55
    var imageFileName = ["cart.png", "clock.png", "pencil.png"]
    var selectedRowNumber: Int?
    var imageArray = [UIImage?]()
    
    override func viewDidLoad() {
        print("AddViewController.viewDidLoad()")
        super.viewDidLoad()
        
        for i in 0 ..< imageFileName.count {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        imageViewFromPickerView.image = imageArray[0]
        selectedRowNumber = 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        selectedRowNumber = row
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageViewFromPickerView.image = imageArray[row]
        
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        print("AddViewController.btnAddItem(sender:)")

        itemsImageFile.append(imageFileName[selectedRowNumber!])
        items.append(tfAddItem.text!) // 전역변수라 그냥 접근 가능
        
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
