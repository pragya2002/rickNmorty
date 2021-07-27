//
//  CustomCell.swift
//  Rick n Morty
//
//  Created by Pragya Awasthi on 26/07/21.
//

import UIKit

class CustomCell: UITableViewCell {

   
    @IBOutlet weak var conView: UIView!
    @IBOutlet weak var avtrImg: UIImageView!
    @IBOutlet weak var charName: UILabel!
    @IBOutlet weak var number: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
