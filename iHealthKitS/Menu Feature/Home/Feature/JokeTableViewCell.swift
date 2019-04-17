//
//  JokeTableViewCell.swift
//  iHealthS
//
//  Created by Apple on 2019/4/16.
//  Copyright © 2019 whitelok.com. All rights reserved.
//

import UIKit

class JokeTableViewCell: UITableViewCell {
    @IBOutlet weak var myTitleLabel: UILabel!
    @IBOutlet weak var myContentView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        clipsToBounds = true
        layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
