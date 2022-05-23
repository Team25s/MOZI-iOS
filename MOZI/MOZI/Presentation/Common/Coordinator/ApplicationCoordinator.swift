//
//  ApplicationCoordinator.swift
//  MOZI
//
//  Created by Noah on 2022/05/20.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    
    var childCoordinators = [Coordinator]()
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    func start() {
     // application coordinator start
    }
}
