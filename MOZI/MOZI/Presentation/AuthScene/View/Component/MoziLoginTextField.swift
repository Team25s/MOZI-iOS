//
//  MoziLoginTextField.swift
//  MOZI
//
//  Created by Noah on 2022/06/05.
//

import SwiftUI

struct MoziLoginTextFieldStyle: TextFieldStyle {
    @Binding var onEditing: Bool
    
    // swiftlint:disable:next identifier_name
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack {
            configuration
                .font(.init(uiFont: .appleSDGothicNeoBold(ofSize: 15)))
            Rectangle()
                .frame(height: 1)
                .foregroundColor(
                    onEditing ? .moziPrimary : Color.init(uiColor: .lightGray)
                )
        }
    }
}
