//
//  ImgurCell.swift
//  Imgur2
//
//  Created by WANKI KIM on 2021/08/17.
//

import UIKit

class ImgurCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(with imgur: Imgur) {
        self.titleLabel.text = imgur.title
        imgur.image { image in
            self.imageView.image = image
        }
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        imageView.image = nil
    }
}
