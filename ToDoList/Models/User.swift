//
//  User.swift
//  ToDoList
//
//  Created by PRACHIKA AGARWAL on 24/03/24.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
