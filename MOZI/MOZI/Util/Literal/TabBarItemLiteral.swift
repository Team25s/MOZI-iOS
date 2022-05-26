//
//  TabBarItemLiteral.swift
//  MOZI
//
//  Created by Noah on 2022/05/25.
//

import UIKit

enum DefaultTabBarItem: CaseIterable {
    case home
    case friend
    case community
    case setting
    
    var index: Int {
        switch self {
        case .home: return 0
        case .friend: return 1
        case .community: return 2
        case .setting: return 3
        }
    }
    
    var deSelectedImage: UIImage {
        switch self {
        case .home: return .load(named: .iconHomeDeSelected)
        case .friend: return .load(named: .iconFriendDeSelected)
        case .community: return .load(named: .iconCommunityDeSelected)
        case .setting: return .load(named: .iconSettingDeSelected)
        }
    }
    
    var selectedImage: UIImage {
        switch self {
        case .home: return .load(named: .iconHomeSelected)
        case .friend: return .load(named: .iconFriendSelected)
        case .community: return .load(named: .iconCommunitySelected)
        case .setting: return .load(named: .iconSettingSelected)
        }
    }
}
