//
//  GalleryViewController.swift
//  AirliftCaseStudy
//
//  Created by AJAY KUMAR on 28/08/2021.
//

import UIKit

class GalleryViewController: UIViewController {
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet var navigationBar : UINavigationBar!
    var contentArray = [SearchBarTableviewCell.nameOfClass(),ExploreTableviewCell.nameOfClass(),TableViewWithCollectionView.nameOfClass()]
    var imagesArray : [ImagesModel] = []
    var SearchText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        reloadTableView()
        getImagesArray()
        // Do any additional setup after loading the view.
    }
    func getImagesArray(text: String = "") {
        weak  var weakSelf = self
        SearchText = text
        ImagesModel.getImages(text: text) { object, status, message in
            if status!{
                weakSelf?.imagesArray = object as! [ImagesModel]
                weakSelf?.updateCell()
            }
        }
    }
    func updateCell(){
        let indexPath1 = IndexPath.init(row: 2, section: 0)

        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath1], with: UITableView.RowAnimation.automatic)
        tableView.endUpdates()
    }
    func registerNibs()  {
        for cell in [ SearchBarTableviewCell.nameOfClass(),ExploreTableviewCell.nameOfClass(),TableViewWithCollectionView.nameOfClass()]{
            let cellNib = UINib(nibName: cell, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: cell)
        }
    }
    func reloadTableView()  {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.reloadData()
        tableView.layoutIfNeeded()
    }
    // BaseClassFunction
    func getController(controllerId:String)->(UIViewController){
        return (self.storyboard?.instantiateViewController(withIdentifier:controllerId))!
    }


}
extension GalleryViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contentArray[indexPath.row], for: indexPath)
        
        //cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        cell.tag = indexPath.row
        
        switch cell {
        case is ExploreTableviewCell:
            let objectCell = cell as! ExploreTableviewCell
            objectCell.initCell()
            objectCell.delegate = self
            break
        case is SearchBarTableviewCell:
            let objectCell = cell as! SearchBarTableviewCell
            objectCell.delegate = self
           break
        case is TableViewWithCollectionView:
            let objectCell = cell as! TableViewWithCollectionView
            objectCell.intlize(objectArray: imagesArray,widthOfView: self.view.bounds.size.width,searchText: SearchText)
            objectCell.delegate = self
            break
            //objectCell.
        default:
            break
        }
        return cell
    }
}
extension GalleryViewController: TableViewWithCollectionViewDelegate{
    func ImageSelected(tag: Int) {
        let controller = getController(controllerId: ImageViewController.nameOfClass()) as! ImageViewController
        controller.object = imagesArray[tag]
        controller.modalTransitionStyle = .crossDissolve
        //controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
}
extension GalleryViewController: SearchBarTableviewCellDelegate{
    func search(tag: Int, text: String) {
    
        getImagesArray(text: text)
    }
}
