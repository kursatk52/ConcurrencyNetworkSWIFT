//
//  User.swift
//  ConcurrencyAndNetwork
//
//  Created by Kursat Korkmaz on 13.02.2023.
//

import Foundation

struct User:Codable ,Identifiable{
    var id : Int
    var name : String
    var username : String
    var email : String
}



