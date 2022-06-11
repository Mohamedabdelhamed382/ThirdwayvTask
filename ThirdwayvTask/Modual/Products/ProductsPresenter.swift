//
//  ProductsPresenter.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 10/06/2022.
//

import Foundation
class ProductsPresenter {
    private weak var view: ProductsViewProtocol?
    private let interactor: ProductsInteractor
    private var products = [ProductsData]()
    private let router: ProductsRouter
    var isLoading: Bool = false
    let file = "file.txt"

    init(view: ProductsViewProtocol, interactor: ProductsInteractor, router: ProductsRouter ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        getData()
    }
    
    func getProductsCount() -> Int{
        return products.count
    }
    
    func productsImageHight(index: Int) -> Int? {
        return products[index].image?.height
    }
    
    func configure(cell: productCellViewProtocol , for index: Int) {
        let product = products[index]
        cell.dispalyDescription(description: product.productDescription ?? "" )
        cell.dispalyImage(imageURl: product.image?.url ?? "")
        cell.dispalyPrice(price: "\(product.price ?? 0) $" )
    }
    
    func didSelectRow(index: Int) {
        let product = products[index]
        router.navigatToProductsDetailsScreen(from: view!, product: product)
    }
    
    func getData() {
        view?.showIndector()
        isLoading = true
        interactor.request { [weak self] result in
            switch result {
            case .success(let data):
                self?.products.append(contentsOf: data)
                DispatchQueue.main.async {
                    self?.view?.fetchingDataSuccess()
                    self?.view?.hideIndector()
                }
            case .failure(let error):
                self?.view?.showError(error: error.localizedDescription)
                if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

                    let fileURL = dir.appendingPathComponent(self?.file ?? "")
                    do {
                        let text = try String(contentsOf: fileURL, encoding: .utf8)
                        let data = Data(text.utf8)
                        let results = try JSONDecoder().decode([ProductsData].self, from: data)
                        self?.products = results
                        DispatchQueue.main.async {
                            self?.view?.fetchingDataSuccess()
                        }
                    }
                    catch {}
                }
            }
            self?.isLoading = false
        }
    }
}
