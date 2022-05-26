//
//  DefaultFriendCoordinator.swift
//  MOZI
//
//  Created by Noah on 2022/05/25.
//

import SwiftUI
import UIKit

final class DefaultFriendCoordinator: FriendCoordinator {
    
    var rootViewController: UINavigationController
    var childCoordinators: [Coordinator]
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    required init(_ rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        self.childCoordinators = [Coordinator]()
    }
    
    convenience init(_ rootViewController: UINavigationController, finishDelegate: CoordinatorFinishDelegate) {
        self.init(rootViewController)
        self.finishDelegate = finishDelegate
    }
    
    func start() {
        let emptyView = UIHostingController(rootView: SwiftUI.EmptyView())
        self.rootViewController.setViewControllers([emptyView], animated: false)
    }
    
    func coordinatorDidFinish() {
        childCoordinators.removeAll()
        self.finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
