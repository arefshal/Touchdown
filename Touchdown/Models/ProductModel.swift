//
//  ProductModel.swift
//  Touchdown
//
//  Created by Aref Shalchi on 2/26/25.
//

import Foundation
struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    let description: String
    let color: [Double]
    
    // Computed Properties
    var formattedPrice: String { return "$\(price)" }
    var red: Double { return color[0] }
    var green: Double { return color[1] }
    var blue: Double { return color[2] }
}

// Sample Product for Preview
let sampleProduct: Product = Product(id: 1, 
                                    name: "Blue Helmet", 
                                    image: "helmet-no1", 
                                    price: 199, 
                                    description: "The football helmet is a piece of protective equipment used mainly in gridiron football. It consists of a hard plastic shell with thick padding on the inside, a face mask made of one or more plastic-coated metal bars, and a chinstrap.", 
                                    color: [0.61, 0.8, 0.89])
