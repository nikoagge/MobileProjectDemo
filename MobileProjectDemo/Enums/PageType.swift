//
//  PageType.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 19/9/21.
//

import UIKit

enum PageType {
    case viewControllers(viewControllers: [UIViewController])
    case viewController(viewController: UIViewController)
//    case mainTabType(mainTabType: MainTabType)
    case bookshelfViewController
    case miscViewController
    case mainViewController
    case personViewController
    case settingsViewController
    case customTabBarController
}
