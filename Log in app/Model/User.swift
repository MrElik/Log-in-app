//
//  User.swift
//  LoginApp
//


import Foundation

// MARK: Здесь содержится информация для входа
struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User (
            login: "Login",
            password: "Password",
            person: Person.getPerson()
        )
    }
    
}
// MARK: Здесь содержится информация по пользователю
struct Person {
    let name: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
        
    }
        
       static func getPerson() -> Person {
        Person(name: "Elnur", surname: "Nukhov", image: "myPhoto")
        
       }
}

