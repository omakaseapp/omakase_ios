//
//  HomeTabBarController.swift
//  Omakase
//
//  Created by Hanzheng Li on 2/7/21.
//

import UIKit

class HomeTabBarController: UITabBarController {

    // MARK: Contained UIViewControllers
    
    private lazy var groupsVC: GroupsViewController = {
        let vc = GroupsViewController()
        let size = CGSize(width: 40.adjustedWidth, height: 30.adjustedHeight)
        vc.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "groupsIconUnselected")?.scaled(to: size),
            selectedImage: UIImage(named: "groupsIconSelected")?.scaled(to: size)
        )
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: HomeTabBarController.tabBarItemVerticalOffset, left: 0, bottom: -HomeTabBarController.tabBarItemVerticalOffset, right: 0)
        return vc
    }()
    
    private lazy var preferencesVC: PreferencesViewController = {
        let vc = PreferencesViewController()
        let size = CGSize(width: 40.adjustedWidth, height: 30.adjustedHeight)
        vc.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(named: "preferencesIconUnselected")?.scaled(to: size),
            selectedImage: UIImage(named: "preferencesIconSelected")?.scaled(to: size)
        )
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: HomeTabBarController.tabBarItemVerticalOffset, left: 0, bottom: -HomeTabBarController.tabBarItemVerticalOffset, right: 0)
        return vc
    }()
    
    // MARK: Vars & Constants
    private let tabBarHeight = 71.adjustedTabBarHeight
    static let tabBarItemVerticalOffset = 20.adjustedHeight
    
    // MARK: Init & Layout
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [groupsVC, preferencesVC]
        selectedViewController = groupsVC
        
        view.backgroundColor = .white

        tabBar.itemPositioning = .fill
        tabBar.isTranslucent = true
        tabBar.tintColor = nil
        tabBar.unselectedItemTintColor = nil
        tabBar.backgroundImage = UIColor.clear.image()
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.clipsToBounds = true
        
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        tabBar.addSubview(blurView)
        blurView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tabBar.sendSubviewToBack(blurView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tabBar.frame.size.height = tabBarHeight
        tabBar.frame.origin.y = view.frame.height - tabBarHeight
    }
}
