//
//  UIFont+Extension.swift
//  MOZI
//
//  Created by Noah on 2022/06/04.
//

import UIKit

extension UIFont {
    static func appleSDGothicNeoRegular(ofSize fontSize: CGFloat) -> UIFont {
        let customFont = UIFont(name: "AppleSDGothicNeo-Regular", size: fontSize)
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        return customFont ?? systemFont
    }
    
    static func appleSDGothicNeoLight(ofSize fontSize: CGFloat) -> UIFont {
        let customFont = UIFont(name: "AppleSDGothicNeo-Light", size: fontSize)
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: .light)
        return customFont ?? systemFont
    }
    
    static func appleSDGothicNeoMedium(ofSize fontSize: CGFloat) -> UIFont {
        let customFont = UIFont(name: "AppleSDGothicNeo-Medium", size: fontSize)
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        return customFont ?? systemFont
    }
    
    static func appleSDGothicNeoSemiBold(ofSize fontSize: CGFloat) -> UIFont {
        let customFont = UIFont(name: "AppleSDGothicNeo-SemiBold", size: fontSize)
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        return customFont ?? systemFont
    }
    
    static func appleSDGothicNeoBold(ofSize fontSize: CGFloat) -> UIFont {
        let customFont = UIFont(name: "AppleSDGothicNeo-Bold", size: fontSize)
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        return customFont ?? systemFont
    }
}
