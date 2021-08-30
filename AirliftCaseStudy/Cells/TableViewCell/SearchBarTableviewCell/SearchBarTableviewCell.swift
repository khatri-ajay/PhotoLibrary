//
//  SearchBarTableviewCell.swift
//  AirliftCaseStudy
//
//  Created by AJAY KUMAR on 28/08/2021.
//

import UIKit
protocol SearchBarTableviewCellDelegate: AnyObject {
    func search(tag: Int,text:String)
}

class SearchBarTableviewCell: UITableViewCell {
    @IBOutlet weak var SearchBar : UISearchBar!
    
    weak var delegate : SearchBarTableviewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SearchBar.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension SearchBarTableviewCell: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("begin editing")
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("end editing")
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        if delegate != nil{
            delegate?.search(tag: tag, text: searchText)
        }
    }
}
