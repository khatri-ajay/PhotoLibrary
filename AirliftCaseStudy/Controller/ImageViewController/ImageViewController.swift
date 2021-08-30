//
//  ImageViewController.swift
//  AirliftCaseStudy
//
//  Created by AJAY KUMAR on 30/08/2021.
//

import UIKit
import AlamofireImage

class ImageViewController: UIViewController {
    @IBOutlet weak var ImageView : UIImageView!
    var object : ImagesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageView.af.setImage(withURL: URL.init(string: object!.largeimageurl!)!)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
