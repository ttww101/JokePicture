//
//  PictureTableViewCell.swift
//  iHealthS
//
//  Created by Apple on 2019/4/16.
//  Copyright © 2019 whitelok.com. All rights reserved.
//

import UIKit

class PictureTableViewCell: UITableViewCell {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
