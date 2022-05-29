//
//  DefaultTabBarCoordinator.swift
//  MOZI
//
//  Created by Noah on 2022/05/25.
//

import UIKit

final class DefaultTabBarCoordinator: Coordinator {
    
    var rootViewController: UITabBarController
    var childCoordinators: [Coordinator]
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    required init() {
        self.rootViewController = UITabBarController()
        self.childCoordinators = [Coordinator]()
    }
    
    convenience init(finishDelegate: CoordinatorFinishDelegate) {
        self.init()
        self.finishDelegate = finishDelegate
    }
    
    func start() {
        let tabBarItems = DefaultTabBarItem.allCases
        let navigationControllers = tabBarItems.map { tabBarItem in
            self.createTabNavigationController(for: tabBarItem)
        }
        self.setupRootViewController(with: navigationControllers)
    }
    
    private func start(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
    
    private func createTabNavigationController(for tabBarItem: DefaultTabBarItem) -> UINavigationController {
        let tabNavigationController = UINavigationController()
        tabNavigationController.tabBarItem = self.setupTabBarItem(for: tabBarItem)
        self.startTabCoordinator(of: tabBarItem, to: tabNavigationController)
        return tabNavigationController
    }
    
    private func setupTabBarItem(for tabBarItem: DefaultTabBarItem) -> UITabBarItem {
        return UITabBarItem(title: nil,
                            image: tabBarItem.deSelectedImage,
                            selectedImage: tabBarItem.selectedImage)
    }
    
    private func setupRootViewController(with tabBarViewControllers: [UIViewController]) {
        self.rootViewController.setViewControllers(tabBarViewControllers, animated: true)
        self.rootViewController.tabBar.backgroundColor = .white
        self.rootViewController.tabBar.isTranslucent = false
        self.rootViewController.selectedIndex = DefaultTabBarItem.home.index
    }
    
    private func startTabCoordinator(of tabBarItem: DefaultTabBarItem,
                                     to tabNavigationController: UINavigationController) {
        switch tabBarItem {
        case .home:
            let homeCoordinator = DefaultHomeCoordinator(tabNavigationController, finishDelegate: self)
            start(childCoordinator: homeCoordinator)
        case .friend:
            let friendCoordinator = DefaultFriendCoordinator(tabNavigationController, finishDelegate: self)
            start(childCoordinator: friendCoordinator)
        case .community:
            let communityCoordinator = DefaultCommunityCoordinator(tabNavigationController, finishDelegate: self)
            start(childCoordinator: communityCoordinator)
        case .setting:
            let settingCoordinator = DefaultSettingCoordinator(tabNavigationController, finishDelegate: self)
            start(childCoordinator: settingCoordinator)
        }
    }
}

extension DefaultTabBarCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        guard let index = self.childCoordinators.firstIndex(where: { $0 === childCoordinator })
        else { return }
        
        self.childCoordinators.remove(at: index)
        branchOffCoordinator(coordinator: childCoordinator)
    }
    
    func coordinatorDidFinish() {
        childCoordinators.removeAll()
        self.finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
    
    private func branchOffCoordinator(coordinator: Coordinator) {
        if coordinator is DefaultSettingCoordinator {
            self.coordinatorDidFinish()
        }
    }
}
