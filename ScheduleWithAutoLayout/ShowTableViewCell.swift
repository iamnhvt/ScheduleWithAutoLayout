//
//  ShowTableViewCell.swift
//  Schedule
//
//  Created by Tuong Pham on 5/12/18.
//  Copyright © 2018 Tuong Pham. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell {
    //Mark: Properties
   
    @IBOutlet weak var showPic: UIImageView!
    @IBOutlet weak var showRating: UILabel!
    @IBOutlet weak var showDuration: UILabel!
    @IBOutlet weak var showTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
