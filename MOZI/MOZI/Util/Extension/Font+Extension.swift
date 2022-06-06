//
//  Font+Extension.swift
//  MOZI
//
//  Created by Noah on 2022/06/04.
//

import SwiftUI
import UIKit

extension Font {
    init(uiFont font: UIFont) {
        self = Font(font as CTFont)
    }
}
