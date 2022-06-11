//
//  ProductsRouter.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 09/06/2022.
//

import Foundation
import UIKit

class ProductsRouter {
    
    class func  createProductsVCRouter() -> UIViewController {
        let productsView = ProductsController() as ProductsViewProtocol
        let router = ProductsRouter()
        let interactor = ProductsInteractor()
        let productsPresenter = ProductsPresenter(view: productsView, interactor: interactor, router: router )
        productsView.presenter = productsPresenter
        return productsView as! UIViewController
    }
    
    func navigatToProductsDetailsScreen(from view: ProductsViewProtocol, product : ProductsData) {
        let productDetailsView = ProductsDetailsRouter.createProductsDetailsVC(product: product)
        if let vc = view as? UIViewController {
            vc.navigationController?.pushViewController(productDetailsView, animated: true)
        }
    }
    
}

