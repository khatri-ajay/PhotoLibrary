//
//  TextCollectionViewCell.swift
//  AirliftCaseStudy
//
//  Created by AJAY KUMAR on 28/08/2021.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var Label : UILabel!
    @IBOutlet weak var view : UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        prepareForReuse()
        // Initialization code
    }
    func intlize(title: String)  {
        view.clipsToBounds = false
        view.layer.cornerRadius = 10
        view.layer.shadowOpacity = 0.7
        
        view.layer.shadowRadius = 1
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        //button.setTitle(title, for: .normal)
        Label.text = title
    }
}
