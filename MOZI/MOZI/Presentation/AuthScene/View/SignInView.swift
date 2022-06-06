//
//  SignInView.swift
//  MOZI
//
//  Created by Noah on 2022/06/05.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        ZStack {
            Color.moziPrimary
            VStack(spacing: 0) {
                TitleLogoView()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height * 0.3)
                InputFrameView()
                    .overlay(alignment: .topLeading) {
                        VStack(alignment: .leading) {
                            Text("Log in")
                                .font(.init(uiFont: .appleSDGothicNeoBold(ofSize: 33)))
                                .padding(EdgeInsets(top: 45,
                                                    leading: 26,
                                                    bottom: 0,
                                                    trailing: 0))
                            UserInfoInputView()
                                .padding(EdgeInsets(top: 0,
                                                    leading: 16,
                                                    bottom: 20,
                                                    trailing: 16))
                        }
                    }
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

struct InputFrameView: View {
    var body: some View {
        ZStack {
            let shape = Rectangle()
                .cornerRadius(15, corners: .topLeft)
                .cornerRadius(15, corners: .topRight)
            shape.foregroundColor(.white)
                .frame(height: UIScreen.main.bounds.height * 0.7)
        }
        
    }
}

struct UserInfoInputView: View {
    
    @State private var userIdentifier: String
    @State private var userPassword: String
    @State private var userIdentifierTextFieldOnEditing: Bool
    @State private var userPasswordTextFeildOnEditing: Bool
    
    init() {
        self.userIdentifier = ""
        self.userPassword = ""
        self.userIdentifierTextFieldOnEditing = false
        self.userPasswordTextFeildOnEditing = false
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("아이디 (이메일)")
                    .font(.init(uiFont: .appleSDGothicNeoBold(ofSize: 14)))
                TextField("아이디 (이메일)을 입력해주세요",
                          text: $userIdentifier,
                          onEditingChanged: { onEditing in
                    self.userIdentifierTextFieldOnEditing = onEditing
                })
                .textFieldStyle(
                    MoziLoginTextFieldStyle(
                        onEditing: self.$userIdentifierTextFieldOnEditing
                    )
                )
                .overlay(alignment: .trailing) {
                    Image(uiImage: .load(named: .errorIcon))
                }
                .autocapitalization(.none)
                .disableAutocorrection(true)
                
                Text("유효하지 않은 아이디입니다.")
                    .font(
                        .init(uiFont: .appleSDGothicNeoLight(ofSize: 12))
                    )
                    .foregroundColor(.red)
                    .padding(EdgeInsets(top: 0,
                                        leading: 0,
                                        bottom: 40,
                                        trailing: 0))
                
                Text("비밀번호")
                    .font(
                        .init(uiFont: .appleSDGothicNeoBold(ofSize: 14))
                    )
                TextField("비밀번호를 입력해주세요",
                          text: $userPassword,
                          onEditingChanged: { onEdit in
                    self.userPasswordTextFeildOnEditing = onEdit
                })
                .textFieldStyle(
                    MoziLoginTextFieldStyle(
                        onEditing: self.$userPasswordTextFeildOnEditing
                    )
                )
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(EdgeInsets(top: 0,
                                    leading: 0,
                                    bottom: 40,
                                    trailing: 0))
                
                Button {
                    // Action for user when pressed
                } label: {
                    let shape = RoundedRectangle(cornerRadius: 26, style: .continuous)
                    shape.fill().foregroundColor(.moziPrimaryStrong)
                        .frame(height: 52)
                        .overlay(alignment: .center) {
                            Text("로그인")
                                .font(
                                    .init(uiFont: .appleSDGothicNeoBold(ofSize: 16))
                                )
                                .foregroundColor(.white)
                        }
                }
                .padding(EdgeInsets(top: 0,
                                    leading: 0,
                                    bottom: 20,
                                    trailing: 0))
                FindUserInfoButtonView()
            }
        }
    }
}

struct FindUserInfoButtonView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 33) {
                Button {
                    // Action for user when pressed
                } label: {
                    Text("아이디 | 비밀번호 찾기")
                        .font(
                            .init(uiFont: .appleSDGothicNeoMedium(ofSize: 13))
                        )
                        .foregroundColor(.gray)
                }
                
                HStack(spacing: 5) {
                    Text("아직")
                    Image(uiImage: .load(named: .subtitleMoziLogo))
                    Text("회원이 아니신가요?")
                    Button {
                        // Action for user when pressed
                    } label: {
                        Text("회원가입")
                            .font(
                                .init(uiFont: .appleSDGothicNeoBold(ofSize: 14))
                            )
                            .foregroundColor(.moziPrimary)
                    }
                    
                }
                .font(
                    .init(uiFont: .appleSDGothicNeoLight(ofSize: 14))
                )
            }
            Spacer()
        }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
