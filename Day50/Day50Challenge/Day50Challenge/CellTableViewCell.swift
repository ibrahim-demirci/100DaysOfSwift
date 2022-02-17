//
//  CellTableViewCell.swift
//  Day50Challenge
//
//  Created by İbrahim Demirci on 17.02.2022.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    var selectedImage: UIImage?
    @IBOutlet var customImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
