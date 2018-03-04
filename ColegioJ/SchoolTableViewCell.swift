//
//  SchoolViewCellTableViewCell.swift
//  ColegioJ
//
//  Created by Juan Manuel Moreno on 2/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var bName: UIButton!
    @IBOutlet weak var iBus: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
