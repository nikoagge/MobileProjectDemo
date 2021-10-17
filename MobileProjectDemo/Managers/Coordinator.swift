//
//  Coordinator.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 19/9/21.
//

import UIKit

protocol Coordinator where Self: UIViewController {
    func navigate(_ navigationItem: NavigationItem)
}

extension Coordinator {
    func navigate(_ navigationItem: NavigationItem) {
        var controllerToNavigate: UIViewController!
        var controllersToInitialNavigation: [UIViewController] = []
        
        switch navigationItem.page {
        case .viewControllers(let viewControllers):
            controllersToInitialNavigation = viewControllers
            
        case .viewController(let viewController):
            controllerToNavigate = viewController
            
        case .bookshelfViewController:
            controllerToNavigate = StoryboardType.bookshelf.getController(BookshelfViewController.self)
            
        case .miscViewController:
            controllerToNavigate = StoryboardType.misc.getController(MiscViewController.self)
            
        case .mainViewController:
            controllerToNavigate = StoryboardType.main.getController(MainViewController.self)
            
        case .personViewController:
            controllerToNavigate = StoryboardType.person.getController(PersonViewController.self)
            
        case .settingsViewController:
            controllerToNavigate = StoryboardType.settings.getController(SettingsViewController.self)
            
        case .customTabBarController:
            controllerToNavigate = StoryboardType.tabBar.getController(CustomTabBarController.self)
        }
        
        DispatchQueue.main.async {
            switch navigationItem.navigationStyle {
            case .present(let animated):
                controllerToNavigate.modalPresentationStyle = .overFullScreen
                self.present(controllerToNavigate, animated: animated)
            case .presentWithinNavigation(let animated, let hidesBottomBar):
                controllerToNavigate.tabBarController?.hidesBottomBarWhenPushed = hidesBottomBar
                let navigationController = UINavigationController(rootViewController: controllerToNavigate)
                navigationController.isNavigationBarHidden = true
                self.present(navigationController, animated: animated)
            case .push(let animated):
                self.navigationController?.pushViewController(controllerToNavigate, animated: animated)
            case .replace(let animated):
                if var viewControllers = self.navigationController?.viewControllers {
                    viewControllers.removeLast()
                    viewControllers.append(controllerToNavigate)
                    self.navigationController?.setViewControllers(viewControllers, animated: animated)
                }
            case .setInitialNavigationRootControllers(let animated):
                Constants.appDelegate.initialNavigationController.setViewControllers(controllersToInitialNavigation, animated: animated)
            }
        }
    }
}
