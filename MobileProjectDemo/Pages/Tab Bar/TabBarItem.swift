//
//  TabBarItem.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 19/9/21.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case bookshelf
    case misc
    case main
    case person
    case settings
    
    func getTitle() -> String {
        switch self {
        case .bookshelf:
            return "Bookshelf"
        case .misc:
            return "Misc"
        case .main:
            return "Main"
        case .person:
            return "Person"
        case .settings:
            return "Settings"
        }
    }
    
    func getActiveIcon() -> UIImage {
        switch self {
        case .bookshelf:
            return UIImage(named: "ic_book_sel")!
        case .misc:
            return UIImage(named: "ic_misc")!
        case .main:
            return UIImage(named: "btn_play")!
        case .person:
            return UIImage(named: "ic_link")!
        case .settings:
            return UIImage(named: "ic_settings")!
        }
    }
    
    var viewController: UIViewController {
        let navigationController = UINavigationController()
        navigationController.setToolbarHidden(true, animated: false)
        navigationController.isNavigationBarHidden = true
        switch self {
        case .bookshelf:
            navigationController.pushViewController(StoryboardType.bookshelf.getController(BookshelfViewController.self)!, animated: false)
        case .misc:
            navigationController.pushViewController(StoryboardType.misc.getController(MiscViewController.self)!, animated: false)
        case .main:
            navigationController.pushViewController(StoryboardType.main.getController(MainViewController.self)!, animated: false)
        case .person:
            navigationController.pushViewController(StoryboardType.person.getController(PersonViewController.self)!, animated: false)
        case .settings:
            navigationController.pushViewController(StoryboardType.settings.getController(SettingsViewController.self)!, animated: false)
        }
        
        return navigationController
    }
    
    var icon: UIImage {
        switch self {
        case .bookshelf:
            return UIImage(named: "ic_book_sel")!
        case .misc:
            return UIImage(named: "ic_misc")!
        case .main:
            return UIImage(named: "btn_play")!
        case .person:
            return UIImage(named: "ic_link")!
        case .settings:
            return UIImage(named: "ic_settings")!
        }
    }
}
