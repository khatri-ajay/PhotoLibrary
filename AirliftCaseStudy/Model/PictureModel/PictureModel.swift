//
//  PictureModel.swift
//  AirliftCaseStudy
//
//  Created by AJAY KUMAR on 30/08/2021.
//
import UIKit

class ImagesModel: NSObject {
    @objc var id: NSNumber?
    @objc var previewurl: String?
    @objc var largeimageurl: String?

    
    
  class  func getImages(text :String?,shouldShowHud : Bool = true, completionHandler: @escaping (AnyObject?,Bool?,String?) -> ()) {
        var url = AppConstant.images + text!
        WebServices.sharedInstance.sendRequestToThirdPartyServer(urlString: url, methodType: .get, shouldShowHud: true) { object, action, status, error in
            if status!{
                var ImagesArray : [ImagesModel] = []
                let json = object as! [String:Any]
                let array = json["hits"] as! [[String:Any]]
                for (_,value) in array.enumerated() {
                    let object = DynamicParser.setValuesOnClass(object: value as [String:Any], classObj: ImagesModel()) as! ImagesModel
                    ImagesArray.append(object)
                }
                completionHandler(ImagesArray as AnyObject,true,nil)
            }else{
                completionHandler(nil,false,error?.localizedDescription)
            }
        }
    }
}
