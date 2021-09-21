//
//  TabNavigationMenu.swift
//  MobileProjectDemo
//
//  Created by Nikos Aggelidis on 19/9/21.
//

import UIKit

class TabNavigationMenu: UIView {
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(menuItems: [TabBarItem], frame: CGRect) {
        self.init(frame: frame)
        
        // Convenience init body
        self.layer.backgroundColor = UIColor.white.cgColor
        self.clipsToBounds = false
        self.isUserInteractionEnabled = true
        self.layer.masksToBounds = false
        
        let shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), cornerRadius : 20)
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.2
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.cornerRadius = 20
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        
        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingAnchor = itemWidth * CGFloat(i)
            
            let itemView = self.createTabItem(item: menuItems[i])
            itemView.tag = i
            self.addSubview(itemView)
            
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            
            var bottomConstant: CGFloat = 5
            if #available(iOS 11, *) {
                bottomConstant = bottomConstant + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0)
            }
            
            NSLayoutConstraint.activate([
                itemView.widthAnchor.constraint(equalToConstant: itemWidth),
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor),
                itemView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -bottomConstant)
            ])
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activateTab(tab: 0) // activate the first tab
    }
    
    
    func createTabItem(item: TabBarItem) -> UIView{
        let tabBarItem = UIView.newAutoLayoutView()
        tabBarItem.tag = 11
        tabBarItem.layer.backgroundColor = UIColor.clear.cgColor
        tabBarItem.clipsToBounds = true
        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap)))


        let deselectedImageView = UIImageView.newAutoLayoutView()
        deselectedImageView.tag = 13
        deselectedImageView.image = item.icon.withRenderingMode(.automatic)
        deselectedImageView.contentMode = .scaleAspectFit
        
        tabBarItem.addSubview(deselectedImageView)
        NSLayoutConstraint.activate([
            deselectedImageView.heightAnchor.constraint(equalToConstant: 21),
            deselectedImageView.widthAnchor.constraint(equalToConstant: 21),
            deselectedImageView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            deselectedImageView.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor),
        ])
        
        
        let itemTitleLabel = UILabel.newAutoLayoutView()
        itemTitleLabel.tag = 12
        itemTitleLabel.text = item.getTitle()
        itemTitleLabel.font = UIFont.systemFont(ofSize: 14)
        itemTitleLabel.textColor = UIColor.black
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.isHidden = true
        itemTitleLabel.lineBreakMode = .byClipping
        itemTitleLabel.minimumScaleFactor = 0.6
        itemTitleLabel.adjustsFontSizeToFitWidth = true
        
        tabBarItem.addSubview(itemTitleLabel)
        NSLayoutConstraint.activate([
            itemTitleLabel.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 4),
            itemTitleLabel.trailingAnchor.constraint(equalTo: tabBarItem.trailingAnchor, constant: -4),
            itemTitleLabel.bottomAnchor.constraint(equalTo: tabBarItem.bottomAnchor, constant: -10)
        ])
        
        
        let selectedImageView = UIImageView.newAutoLayoutView()
        selectedImageView.tag = 14
        selectedImageView.layer.cornerRadius = 10
        selectedImageView.image = item.getActiveIcon().withRenderingMode(.automatic)
        selectedImageView.contentMode = .scaleAspectFit
        selectedImageView.isHidden = true
        
        tabBarItem.addSubview(selectedImageView)
        NSLayoutConstraint.activate([
            selectedImageView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            selectedImageView.heightAnchor.constraint(equalToConstant: 21),
            selectedImageView.widthAnchor.constraint(equalToConstant: 21),
            selectedImageView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 14),
            selectedImageView.bottomAnchor.constraint(equalTo: itemTitleLabel.topAnchor, constant: -2)
        ])
        

        return tabBarItem
        
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    
    func switchTab(from: Int, to: Int) {
        self.deactivateTab(tab: from)
        self.activateTab(tab: to)
    }
    
    func activateTab(tab: Int) {
        guard self.subviews.count > tab else { return }
        
        let tabToActivate = self.subviews[tab]
        
        tabToActivate.viewWithTag(12)?.isHidden = false
        tabToActivate.viewWithTag(13)?.isHidden = true
        tabToActivate.viewWithTag(14)?.isHidden = false
        
        self.itemTapped?(tab)
        self.activeItem = tab
    }
    
    func deactivateTab(tab: Int) {
        guard self.subviews.count > tab else { return }
        
        let inactiveTab = self.subviews[tab]
        
        inactiveTab.viewWithTag(12)?.isHidden = true
        inactiveTab.viewWithTag(14)?.isHidden = true
        inactiveTab.viewWithTag(13)?.isHidden = false
    }
}
