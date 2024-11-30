//
// LoginView.swift
// eaar-rt
//
// Created by Elvis on 29/11/24.
//


import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login").font(.largeTitle).bold()
            
            TextField("Usuario", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            SecureField("Contraseña", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage).foregroundColor(.red)
            }
            
            Button("Iniciar Sesión") {
                viewModel.login()
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.username.isEmpty || viewModel.password.isEmpty)
        }
        .padding()
        .fullScreenCover(isPresented: $viewModel.isLoggedIn) {
            MovieListView()
        }
    }
}
