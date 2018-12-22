//
//  ImageListTableViewCell.swift
//  Digidentity
//
//  Created by Denis Skokov on 14/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

class ImageListTableViewCell: UITableViewCell {
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var confidenceLabel: UILabel!
    
    func update(listItem: ListDisplayItem) {
        pictureImageView.image = listItem.image
        descriptionLabel.text = listItem.text
        idLabel.text = listItem.id
        confidenceLabel.text = listItem.confidence
    }

}
