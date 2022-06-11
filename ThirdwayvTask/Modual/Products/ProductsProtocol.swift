//
//  ProductsProtocol.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 10/06/2022.
//

import UIKit

protocol ProductsInteractorToPresenterProtocol: AnyObject {
    func productLoadSuccess(_ products: [ProductsData])
    func productLoadFail(_ error: Error)
}

protocol ProductsViewProtocol: AnyObject {
    var presenter: ProductsPresenter? { get set }
    func showIndector()
    func hideIndector()
    func showError(error: String)
    func fetchingDataSuccess()
}

protocol productCellViewProtocol {
    func dispalyImage(imageURl: String)
    func dispalyPrice(price: String)
    func dispalyDescription(description: String)
}
