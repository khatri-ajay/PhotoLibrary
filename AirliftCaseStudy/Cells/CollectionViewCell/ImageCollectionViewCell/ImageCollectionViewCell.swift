//
//  ImageCollectionViewCell.swift
//  AirliftCaseStudy
//
//  Created by AJAY KUMAR on 30/08/2021.
//

import UIKit
import AlamofireImage

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView  : UIImageView!
    @IBOutlet weak var View  : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
      
        // Initialization code
    }
    func intlize(image: String)  {
        View.layer.cornerRadius = 5
        imageView.af.setImage(withURL: URL(string: image)!)

    }

}
