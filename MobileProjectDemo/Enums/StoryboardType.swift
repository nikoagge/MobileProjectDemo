//
//  StoryboardType.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 19/9/21.
//

import UIKit

enum StoryboardType: String {
    case bookshelf = "Bookshelf"
    case misc = "Misc"
    case main = "Main"
    case person = "Person"
    case settings = "Settings"
    case tabBar = "TabBar"
    
    func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func getController<T: UIViewController>(_ type: T.Type, setup: ((T) -> Void) = { _ in }) -> T? {
        if let viewController = self.getStoryboard().instantiateViewController(withIdentifier: String(describing: T.self)) as? T {
            setup(viewController)
            return viewController
        }
        return nil
    }
}
