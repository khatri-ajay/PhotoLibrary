//
//  WebServices.swift
//  AirliftCaseStudy
//
//  Created by AJAY KUMAR on 28/08/2021.
//

import Foundation
import Alamofire
import UIKit
import MBProgressHUD

class WebServices : NSObject{
    
    let webHeader:HTTPHeaders = ["accept":"application/json"]
    var hudView : MBProgressHUD!
    var alertWindow : UIWindow!
//    var objLinksModel: LinksModel!
//    var objPaginateModel: PaginateModel!

    static let sharedInstance = WebServices()
    
    private override init() {
        self.hudView = MBProgressHUD()
//        self.objLinksModel = LinksModel()
//        self.objPaginateModel = PaginateModel()

    }
    func getHeaders()->(HTTPHeaders){
        return ["accept":"application/json"]
    }
    func sendRequestToThirdPartyServer(urlString: String,
                             methodType : HTTPMethods,
                             param:[String : AnyObject]? = nil,
                             shouldShowHud : Bool = true,
                             completionHandler: @escaping (AnyObject?, NSDictionary?, Bool?, Error?) -> ())
    {
        
        if shouldShowHud{
            showHud(message: "")
        }
        
        let typeMethod: HTTPMethod = HTTPMethod(rawValue: methodType.rawValue)
        AF.request(urlString, method: typeMethod, parameters: param, headers: webHeader).responseJSON { response in
            print("Request URL : " + urlString)
            print("Param : ",param ?? "")
            print(response)
            self.hideHud()
            switch response.result {
            case .success(let JSON):
                let object = JSON as? AnyObject
                completionHandler(object , nil, true,nil)
            case .failure(let error):
                print(error)
                self.showAlertController(message: error.localizedDescription)
                //                    completionHandler(nil, nil, false,error)
            }
        }
    }
    
    func showHud(message:String){
        print("adding hud on Services")

        let window: UIView =  UIApplication.shared.windows.first!
        hudView = MBProgressHUD.showAdded(to: window, animated: true)
    }
    
    func hideHud(){
        
        let window: UIView =  UIApplication.shared.windows.first!
        DispatchQueue.global(qos: .background).async {
            // Go back to the main thread to update the UI
            DispatchQueue.main.async {
                print("removing hud on webservices")
                MBProgressHUD.hideAllHUDs(for: window, animated: false)
                
                
//                MBProgressHUD.hide(for: window, animated: true)
            }
        }
    }
    
    func showAlertController(message:String){
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action -> Void in
            alert.dismiss(animated: true, completion: nil)
            self.alertWindow=nil
        })
        alert.addAction(okAction)
        
        self.alertWindow = UIWindow.init(frame: UIScreen.main.bounds)
        self.alertWindow.rootViewController = UIViewController()
        self.alertWindow.windowLevel = UIWindow.Level.alert + 1
        self.alertWindow.makeKeyAndVisible()
        self.alertWindow.rootViewController?.present(alert, animated: false, completion: nil)
    }
}
