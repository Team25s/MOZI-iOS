//
//  CoordinatorFinishDelegate.swift
//  MOZI
//
//  Created by Noah on 2022/05/25.
//

import Foundation

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
