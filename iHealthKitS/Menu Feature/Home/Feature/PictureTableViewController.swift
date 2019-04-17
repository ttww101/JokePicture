//
//  PictureTableViewController.swift
//  iHealthS
//
//  Created by Apple on 2019/4/16.
//  Copyright © 2019 whitelok.com. All rights reserved.
//

import UIKit
import Alamofire

@objc
class PictureTableViewController: UITableViewController {
    var titles: [String] = []
    var images: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "joke_2016x2688_back"))
        tableView.backgroundView = imageView
        tableView.allowsSelection = false
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "PictureTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    Alamofire.request("http://47.75.131.189/a3cf7dd66c5871ee94171ce44b86f377/?type=picture").responseJSON { (response) in
            if response.result.isSuccess {
                if let json = response.result.value as? [String: Any] {
                    for i in json["data"] as! [[String: String]] {
                        self.titles.append(i["title"]!)
                        self.images.append(i["image"]!)
                    }
                }
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PictureTableViewCell
        let row = indexPath.row
        cell.myLabel.text = titles[row]
        let imageUrlStr = images[row]
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL(string: imageUrlStr)!) {
                let image = UIImage.sd_animatedGIF(with: data)
                DispatchQueue.main.async {
                    cell.myImageView.image = image
                }
            }
        }

        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
