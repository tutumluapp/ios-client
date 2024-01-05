//
//  AuthenticationManager.swift
//  tutumlu
//
//  Created by ali-kerem on 5.01.2024.
//

import Foundation
import Supabase

class AuthenticationManager {
    let client = SupabaseClient(supabaseURL: URL(string: "https://qbpruczdytiwqouzoztl.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFicHJ1Y3pkeXRpd3FvdXpvenRsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTcxMzE0ODUsImV4cCI6MjAxMjcwNzQ4NX0.aWqvr3-qOnJGQXZwk4GVNVXRnd2OKMOn3fkWF8Pm2UE")
        
    func signUp(for userdata: SignupModel) async throws {
        do {
            try await client.auth.signUp(
                email: userdata.email,
                password: userdata.password,
                data: [
                    "user_name": .string(userdata.username),
                    "profile_name": .string(userdata.profileName)
              ]
            )
        } catch {
            print("Error signing up: \(error)")
            throw error
        }
    }
    
    func login(for userdata: LoginModel) async -> Result<LoginResponse, Error> {
        do {
            try await client.auth.signIn(email: userdata.email, password: userdata.password)
            return .success(.success)
        } catch {
            print("Error logging in: \(error)")
            return .failure(error)
        }
    }
}
