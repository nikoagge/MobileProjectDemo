//
//  Constants.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 19/9/21.
//

import UIKit

class Constants {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    static let bundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    static let osVersion = UIDevice.current.systemVersion
    static let appPlatform = "ios"
    static let deviceManufacturer = "Apple Inc."
}
