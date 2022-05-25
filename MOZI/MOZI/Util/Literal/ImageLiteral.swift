//
//  ImageLiteral.swift
//  MOZI
//
//  Created by Noah on 2022/05/25.
//

import UIKit

enum ImageLiteral: String {
    case iconCommunityDeSelected = "icon_community_de_selected"
    case iconFriendDeSelected = "icon_friend_de_selected"
    case iconHomeDeSelected = "icon_home_de_selected"
    case iconSettingDeSelected = "icon_setting_de_selected"
    
    case iconCommunitySelected = "icon_community_selected"
    case iconFriendSelected = "icon_friend_selected"
    case iconHomeSelected = "icon_home_selected"
    case iconSettingSelected = "icon_setting_selected"
}

extension UIImage {
    static func load(named imageName: ImageLiteral) -> UIImage {
        guard let image = UIImage(named: imageName.rawValue, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName.rawValue
        return image
    }
}
