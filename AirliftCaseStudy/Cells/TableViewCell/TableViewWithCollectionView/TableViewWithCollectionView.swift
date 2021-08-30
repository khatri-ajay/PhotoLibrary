//
//  TableViewWithCollectionView.swift
//  AirliftCaseStudy
//
//  Created by AJAY KUMAR on 29/08/2021.
//

import UIKit
protocol TableViewWithCollectionViewDelegate: AnyObject {
    func ImageSelected(tag: Int)
}

class TableViewWithCollectionView: UITableViewCell {
    
    @IBOutlet weak var TitleLabel :UILabel!
    @IBOutlet weak var collectionViewHeight : NSLayoutConstraint!
    @IBOutlet weak var collectionView : UICollectionView!
    
    var contentArray: [ImagesModel] = []
    weak var delegate : TableViewWithCollectionViewDelegate?
    var cellWidth :CGFloat?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func intlize(objectArray:[ImagesModel],widthOfView: CGFloat,searchText: String) {
        if searchText == ""{
            TitleLabel.text = "Popular"
        }else {
            TitleLabel.text = "Search result for " + searchText
        }
        cellWidth = widthOfView
        contentArray = objectArray
        reloadCollectionView()
        let height1 = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeight.constant = height1
        collectionView.layoutSubviews()
        collectionView.layoutIfNeeded()
    }
   
    func registerNibs()  {
        collectionView.register(UINib(nibName: ImageCollectionViewCell.nameOfClass(), bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.nameOfClass())
    }
    func reloadCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
    override func layoutSubviews() {
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
   
}

extension TableViewWithCollectionView: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
    return CGSize(width: (cellWidth!/2) - 20  , height: (cellWidth!/2) - 20)
        

    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.nameOfClass(),for:indexPath) as! ImageCollectionViewCell
        cell.tag = indexPath.row
        cell.backgroundColor = UIColor.clear
        cell.intlize(image: contentArray[indexPath.row].previewurl!)
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if delegate != nil{
            delegate?.ImageSelected(tag: indexPath.row)
        }
    }
}
