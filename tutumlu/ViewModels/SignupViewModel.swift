//
//  SignupViewModel.swift
//  tutumlu
//
//  Created by ali-kerem on 5.01.2024.
//

import Foundation

class SignupViewModel {
    private var signupModel: SignupModel?
    
    func signup(username: String, profileName: String, email: String, password: String) async {
        signupModel = SignupModel(username: username, profileName: profileName, email: email, password: password)
        do {
            try await networkCall(signupData: signupModel!)
        } catch {
            print("Error signing up: \(error)")
        }

    }
    
    private func networkCall(signupData: SignupModel) async throws  {
        let authManager = AuthenticationManager()
        try await authManager.signUp(for: signupData)
    }
}
