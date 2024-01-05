//
//  LoginModel.swift
//  tutumlu
//
//  Created by ali-kerem on 5.01.2024.
//

struct SignupModel {
    var username: String
    var profileName: String
    var email: String
    var password: String
}

enum LoginResponse {
    case success
    case failure
}
