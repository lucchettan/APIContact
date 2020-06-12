//
//  ResultFromJson.swift
//  Contacts
//
//  Created by Nicolas Lucchetta on 18/11/2019.
//  Copyright © 2019 Nicolas Lucchetta. All rights reserved.
//

import Foundation

struct ResultJson: Decodable {
    var results: [User]
}

struct User: Decodable {
    var gender: String
    var name: Name
//    var location: Location
    var email: String
    var login: Login
    var dob: DOB
    var cell: String
    var picture: Picture
    var nat: String
}

struct Name : Decodable {
    var title: String
    var first: String
    var last: String
}

struct Location: Decodable {
    var street: String
    var city: String
    var state: String
}

struct Login: Decodable {
    var uuid: String
    var username: String
}

struct DOB: Decodable {
    var date: String
    var age: Int
}

struct Picture: Decodable {
    var large: String
    var medium: String
    var thumbnail: String
}
