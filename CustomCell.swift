//
//  CustomCell.swift
//  Janki-Demo
//
//  Created by admin on 6/12/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class CustomCell: UITableViewCell {

    @IBOutlet var lblTitle : UILabel!
    @IBOutlet var lblDetails : UILabel!
    @IBOutlet var lblPortfolio : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
