//
//  ApiResponse.swift
//  Yummie
//
//  Created by MOHAMED ABD ELHAMED AHMED on 24/01/2022.
//

import Foundation

// MARK: - ProductsResponseElement
struct ProductsData: Codable {
    let id: Int?
    let productDescription: String?
    let image: Image?
    let price: Int?
}

// MARK: - Image
struct Image: Codable {
    let width, height: Int?
    let url: String?
}
