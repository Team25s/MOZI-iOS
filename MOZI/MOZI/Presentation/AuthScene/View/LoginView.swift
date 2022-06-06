//
//  LoginView.swift
//  MOZI
//
//  Created by Noah on 2022/06/05.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Color.moziPrimary
            VStack(spacing: 0) {
                TitleLogoView()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height * 0.3)
            }
        }
        .ignoresSafeArea()
    }
}

struct TitleLogoView: View {
    var body: some View {
        HStack(spacing: 11) {
            Image(uiImage: .load(named: .titleMoziLogoIcon))
            Image(uiImage: .load(named: .titleMoziLogo))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
