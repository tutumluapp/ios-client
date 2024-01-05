//
//  LoginViewModel.swift
//  tutumlu
//
//  Created by ali-kerem on 5.01.2024.
//

class LoginViewModel {
    private var loginModel: LoginModel?
    
    func login(email: String, password: String) async -> Bool {
        loginModel = LoginModel(email: email, password: password)
        let authManager = AuthenticationManager()
        
        let result = await authManager.login(for: loginModel!)
        switch result {
        case .success:
            return true
        case .failure:
            return false
        }
    }
}
