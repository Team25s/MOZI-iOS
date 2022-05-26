//
//  ApplicationCoordinator.swift
//  MOZI
//
//  Created by Noah on 2022/05/20.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    var childCoordinators: [Coordinator]
    
    init(_ window: UIWindow) {
        self.window = window
        self.childCoordinators = [Coordinator]()
    }
    
    func start() {
        self.startTabBarCoordinator()
    }
    
    private func start(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
    
    private func startTabBarCoordinator() {
        let tabBarCoordinator = DefaultTabBarCoordinator(finishDelegate: self)
        start(childCoordinator: tabBarCoordinator)
        window.rootViewController = tabBarCoordinator.rootViewController
    }
}

extension ApplicationCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        guard let index = self.childCoordinators.firstIndex(where: { $0 === childCoordinator })
        else { return }
        
        self.childCoordinators.remove(at: index)
        branchOffCoordinator(coordinator: childCoordinator)
    }
    
    private func branchOffCoordinator(coordinator: Coordinator) {
        if coordinator is DefaultTabBarCoordinator {
            // start AuthCoordinator
        }
    }
}
