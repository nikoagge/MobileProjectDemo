//
//  NavigationStyle.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 19/9/21.
//

import Foundation

enum NavigationStyle {
    case present(animated: Bool)
    case presentWithinNavigation(animated: Bool, hidesBottomBar: Bool)
    case push(animated: Bool)
    case replace(animated: Bool)
    case setInitialNavigationRootControllers(animated: Bool)
}
