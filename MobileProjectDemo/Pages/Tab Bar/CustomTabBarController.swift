//
//  CustomTabBarController.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 19/9/21.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    static let shared = CustomTabBarController()
    
    var customTabBar : TabNavigationMenu!
    var tabBarHeight: CGFloat = 420.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        UITabBar.appearance().addShadow()
        if #available(iOS 11, *) {
            tabBarHeight = tabBarHeight + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0)
        }
        loadTabBar()
    }
    
    func loadTabBar() {
        let tabItems: [TabBarItem] = [.bookshelf, .misc, .main, .person, .settings]
        viewControllers = setupCustomTabBar(tabItems)
        selectedIndex = 0
    }
    
    func setupCustomTabBar(_ items: [TabBarItem]) -> [UIViewController] {
        let frame = CGRect(x: tabBar.frame.origin.x, y: tabBar.frame.origin.x, width: tabBar.frame.width, height: tabBarHeight)
        
        var controllers = [UIViewController]()

        tabBar.isHidden = true
        
        customTabBar = TabNavigationMenu(menuItems: items, frame: frame)
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customTabBar)
        
        customTabBar.itemTapped = self.changeTab
//        let bgView = UIImageView(image: UIImage(named: "tabs_bg"))
//        bgView.contentMode = .scaleToFill
//        self.customTabBar.addSubview(bgView)
//
//
//        self.customTabBar.sendSubviewToBack(bgView)
        
        var image = UIImage(named: "tabs_bg")
        if let image = image {
            var centerImage: Bool = false
            var resizeImage: UIImage?
            let size = CGSize(width: UIScreen.main.bounds.size.width, height: 98)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            if centerImage {
                //if you want to center image, use this code
                image.draw(in: CGRect(origin: CGPoint(x: (size.width-image.size.width)/2, y: 0), size: image.size))
            }
            else {
                //stretch image
                image.draw(in: CGRect(origin: CGPoint.zero, size: size))
            }
            resizeImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            tabBar.backgroundImage = resizeImage?.withRenderingMode(.alwaysOriginal)
        }

        NSLayoutConstraint.activate([
            customTabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            customTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
//        bgView.topAnchor.constraint(equalTo: customTabBar.topAnchor).isActive = true
//        bgView.bottomAnchor.constraint(equalTo: customTabBar.bottomAnchor).isActive = true
//        bgView.leftAnchor.constraint(equalTo: customTabBar.leftAnchor).isActive = true
//        bgView.rightAnchor.constraint(equalTo: customTabBar.rightAnchor, constant: 400).isActive = true
        
        for i in 0 ..< items.count {
            controllers.append(items[i].viewController)
        }
        self.view.layoutIfNeeded()
        
        return controllers
    }
    
    func setSelectedIndex(newSelectedIndex: Int) {
        customTabBar.switchTab(from: selectedIndex, to: newSelectedIndex)
    }
    
    func changeTab(tab: Int) {
//        if tab == TabBarItem.more.rawValue {
//            if let viewcontrollers = self.viewControllers,
//                let moreNavigationController = viewcontrollers[tab] as? UINavigationController,
//                moreNavigationController.topViewController is PromosViewController || moreNavigationController.topViewController is AboutViewController || moreNavigationController.topViewController is SettingsViewController {
//                moreNavigationController.popViewController(animated: true)
//            }
//        }
        self.selectedIndex = tab
    }
}
