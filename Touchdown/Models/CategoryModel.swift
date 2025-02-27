//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Aref Shalchi on 2/26/25.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
