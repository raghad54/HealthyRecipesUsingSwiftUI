//
//  Constants.swift
//
//  Created by mohamed abdo on 4/21/18.
//
import UIKit

struct Constants {
    static var storyboard = Router.instance.storyboard
    static let itunesURL = "itms-apps://itunes.apple.com/app/id1330387425"
    static let FCMTYPE = "2"
    static let FCMTOKEN: String = {
        return UD.DEVICE_TOKEN ?? "nil"
    }()
    static let DEVICEID = UIDevice.current.identifierForVendor!.uuidString
}
