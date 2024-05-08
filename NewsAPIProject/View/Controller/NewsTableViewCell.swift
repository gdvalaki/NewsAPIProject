//
//  NewsTableViewCell.swift
//  NewsAPIProject
//
//  Created by R91 on 09/04/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var txtDiscription: UILabel!
    @IBOutlet weak var tableViewCellImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
