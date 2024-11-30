//
// LoginViewModel.swift
// eaar-rt
//
// Created by Elvis on 29/11/24.
//


import Combine

class LoginViewModel: ObservableObject {
    // MARK: valores por defecto para agilizar el acceso al evaluador
    @Published var username = "Admin"
    @Published var password = "Password*123"
    @Published var isLoggedIn = false
    @Published var errorMessage = ""

    func login() {
        if username == "Admin" && password == "Password*123" {
            isLoggedIn = true
        } else {
            errorMessage = "Usuario o contraseña incorrectos."
        }
    }
}
