//
//  Post.swift
//  ConcurrencyAndNetwork
//
//  Created by Kursat Korkmaz on 13.02.2023.
//

import Foundation


struct Post : Codable, Identifiable{
    var id : Int
    var userId : Int
    var title : String
    var body : String
}
