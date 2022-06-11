//
//  ProductsDetailsPresenter.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 11/06/2022.
//

import Foundation
protocol productDetailsViewProtocol:AnyObject {
    var presenter: ProductsDetailsPresenter? { get set }
    func dispalyImage(imageURl: String)
    func dispalyPrice(price: String)
    func dispalyDescription(description: String)
}

class ProductsDetailsPresenter {
    
    weak var view: productDetailsViewProtocol?
    private var product: ProductsData
    
    init(view: productDetailsViewProtocol?, product: ProductsData) {
        self.view = view
        self.product = product
    }
    
    func viewDidLoad() {
        view?.dispalyPrice(price: "\(product.price ?? 0)")
        view?.dispalyDescription(description: product.productDescription ?? "" )
        view?.dispalyImage(imageURl: product.image?.url ?? "")
    }
    
}
