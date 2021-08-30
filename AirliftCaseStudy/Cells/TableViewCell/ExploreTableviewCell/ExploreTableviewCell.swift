//
//  ExploreTableviewCell.swift
//  AirliftCaseStudy
//
//  Created by AJAY KUMAR on 28/08/2021.
//

import UIKit


class ExploreTableviewCell: UITableViewCell {
    weak var delegate : SearchBarTableviewCellDelegate?
    @IBOutlet weak var collectionView : UICollectionView!
    var contentArray = ["Food","Cars","Cities","Mountains","People","Work","Fashion","Animals","Interior"]
    

    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func registerNibs()  {
        collectionView.register(UINib(nibName: TextCollectionViewCell.nameOfClass(), bundle: nil), forCellWithReuseIdentifier: TextCollectionViewCell.nameOfClass())
    }
    func reloadCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
    func initCell(){
            reloadCollectionView()
    }
    func changeHeight() {
       
    }
}

extension ExploreTableviewCell: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        //let size1 = (contentArray[indexPath.row] as String).size(withAttributes: nil)
//        return CGSize(width: self.frame.width , height:  self.frame.height )
        let size: CGSize = contentArray[indexPath.row].size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0)])
        
        return CGSize(width: size.width + 30, height: 40)
//        return CGSize(width: 100.0, height: 60)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCollectionViewCell.nameOfClass(),for:indexPath) as! TextCollectionViewCell
        cell.tag = indexPath.row
        cell.backgroundColor = UIColor.clear
        cell.intlize(title: contentArray[indexPath.row])
//        cell.layer.cornerRadius = 10
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.gray.cgColor
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if delegate != nil{
            delegate?.search(tag: tag,text: contentArray[indexPath.row])
        }
    }
}
