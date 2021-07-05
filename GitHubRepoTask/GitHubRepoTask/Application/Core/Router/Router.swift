//
//  Router.swift
//  BaseIOS
//
//  Created by M.abdu on 10/12/20.
//  Copyright © 2020 com.Rowaad. All rights reserved.
//

import Foundation
import UIKit
// MARK: - ...  Router for All Application
class Router: NSObject {
    struct Static {
        static var instance: Router?
    }
    class var instance: Router {
        if Static.instance == nil {
            Static.instance = Router()
        }
        return Static.instance!
    }
    let storyboard = UIStoryboard(name: "GitHubRepoListStoryboard", bundle: nil)
    // MARK: - ...  Restart the main storyboard
    func restart(storyboard: UIStoryboard = Router.instance.storyboard) {
        let scene = storyboard.instantiateInitialViewController()
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.window?.rootViewController = scene
    }
    // MARK: - ...  Restart the auth storyboard
//    func unAuthorized(storyboard: UIStoryboard = Router.instance.storyboard) {
//        let scene = storyboard.instantiateInitialViewController()
//        let delegate = UIApplication.shared.delegate as? AppDelegate
//        delegate?.window?.rootViewController = scene
//    }
    
//    func maintance() {
//        let scene = UIApplication.topViewController() as? BaseController
//        scene?.showMaintanceScreen()
//    }
//    func networkFail() {
//        let scene = UIApplication.topViewController() as? BaseController
//        scene?.showNetworkFailScreen()
//    }
}
