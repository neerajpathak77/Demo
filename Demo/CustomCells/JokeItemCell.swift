//
//  JokeItemCell.swift
//  Demo
//
//  Created by neeraj on 07/05/18.
//  Copyright © 2018 neeraj. All rights reserved.
//

import UIKit

class JokeItemCell: UITableViewCell, NibLoadableViewProtocol {

    @IBOutlet weak var itemDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpCell(model: InfoModel?, indexpath: IndexPath) {
        self.itemDescriptionLabel.text = model?.joke
        contentView.backgroundColor = indexpath.row % 2 == 0 ? UIColor().color(hex: "#F5F5F5") : UIColor().color(hex: "#EDEDED")
    }

    override func prepareForReuse() {
        itemDescriptionLabel.text = nil
        contentView.backgroundColor = .clear
    }
}
