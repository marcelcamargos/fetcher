//
//  Cat.swift
//  Fetcher
//
//  Created by Marcel Camargos on 07/02/23.
//

struct Cat: Codable {
    var id: String?
    var tags: [Tag]?
    var images: [CatImage]?
}
