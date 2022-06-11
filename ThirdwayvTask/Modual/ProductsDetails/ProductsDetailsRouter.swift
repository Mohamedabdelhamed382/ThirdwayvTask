//
//  ProductsDetailsRouter.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 11/06/2022.
//

import UIKit
class ProductsDetailsRouter {
    
    class func createProductsDetailsVC(product: ProductsData) -> UIViewController {
        
        let ProductsDetailsVC = ProductsDetailsController()
        if let productsDetailsView = ProductsDetailsVC as? productDetailsViewProtocol {
            let presenter = ProductsDetailsPresenter(view: ProductsDetailsVC, product: product)
            productsDetailsView.presenter  = presenter
        }
        return ProductsDetailsVC
    }
}
