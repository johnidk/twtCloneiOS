//
//  MainTabController.swift
//  twitterCloned
//
//  Created by João Gabriel Lavareda Ayres Barreto on 15/05/23.
//

import UIKit

/// This file is what manages the different screens inside the application, use this file as a headstart to understand how this application works
class MainTabController: UITabBarController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
        configureUI()
        setupTabBar()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Properties
    let actionButton: UIButton = {
        let btn = UIButton(type: .system)
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = (UIImage(systemName: "text.badge.plus", withConfiguration: configuration))
        btn.tintColor = .white
        btn.backgroundColor = .blue
        btn.setImage(image, for: .normal)
        return btn
    }()
    
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor ,paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers() {
        
        let feed = FeedController()
        feed.setTabBarImage(imageName: "house.fill", title: "Feed")
        let feedNC = UINavigationController(rootViewController: feed)
        
        let explore = ExploreController()
        explore.setTabBarImage(imageName: "magnifyingglass", title: "Explore")
        let exploreNC = UINavigationController(rootViewController: explore)
        
        let notifications = NotificationsController()
        notifications.setTabBarImage(imageName: "bell.badge.fill", title: "Notification")
        let notificationsNC = UINavigationController(rootViewController: notifications)

        let conversations = ConversationsController()
        conversations.setTabBarImage(imageName: "ellipsis.message.fill", title: "Conversation")
        let conversationsNC = UINavigationController(rootViewController: conversations)

        
        let tabBarList = [feedNC, exploreNC, notificationsNC, conversationsNC]
        feedNC.setStatusBar()
        
        
        viewControllers = tabBarList
        
    }
    
    func templateNavigationControl(image: UIImage?, viewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        
        return nav
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .black
        tabBar.isTranslucent = true
        tabBar.backgroundColor = .white
    }


}
