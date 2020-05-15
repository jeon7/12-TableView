//
//  TableViewController.swift
//  12 TableView
//
//  Created by Gukhwa Jeon on 12.05.20.
//  Copyright © 2020 G-Kay. All rights reserved.
//

import UIKit

var items = ["buy book", "date with jw", "prepare for study"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        print("TableViewController.viewDidLoad()")
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // 바 버튼(edit)이용하여 셀 선택 삭제 가능
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // 뷰가 노출 될 때마다 리스트의 데이터를 다시 불러옴
    override func viewWillAppear(_ animated: Bool) {
        print("TableViewController.vieWillAppear()")
        tvListView.reloadData()
    }

    // MARK: - Table view data source

    // 테이블 안에 섹션개수를 1로 설정함
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("TableViewController.numberOfSections(tableView:), 섹션개수를 1로 설정함")
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 색션당 열(행)의 개수를 전달
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("TableViewController.tableView(tableView:,numberOfRowsInSection), 색션당 열(행)의 개수를 전달")
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    // 위에 선언한 변수(items, itemsImageFile)를 셀에 삽입함
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("TableViewController.tableView(tableView:,cellForRowAt), 변수(items, itemsImageFile)를 셀에 삽입함")
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    // 선택한 셀 편집 (delete, insert)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("TableViewController.tableView(tableView:,commit,forRowAt), 선택한 셀 편집")

        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // delete 글자 바꾸기
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        print("TableViewController.tableView(tableView:,titleForDeleteConfirmationButtonForRowAt), delete 글자 바꾸기")
        return "löschen"
    }
    
    
    // Override to support rearranging the table view.
    // 목록 순서 바꾸기
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        print("TableViewController.tableView(tableView:,moveRowAt,to:), 목록 순서 바꾸기")
        // 이 순서로 해야 에러가 없음. items와 itemsImageFile의 배열을 sorting(remove랑 insert함수로)
        // 선택한 아이템 인덱스와 옮겨지는 위치 인덱스는 argument:전달인자 에서 받음
        // 아이템이미지관련 코드3줄 혹은 아이템텍스트 코드3줄 주석처리해도 에러없이 화면 제대로 보여줌.. => 하지만 dump로 확인해보니 꼬임
        let itemToMove: String = items[(fromIndexPath as NSIndexPath).row]
        let itemImageToMove: String = itemsImageFile[(fromIndexPath as NSIndexPath).row]
        items.remove(at: (fromIndexPath as NSIndexPath).row)
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        
        dump(items)
        dump(itemsImageFile)
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // 테이블 뷰에서 선택한 셀의 내용을 디테일 뷰로 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("TableViewController.prepare(segue:,sender:)")
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
        }
    }
    
}
