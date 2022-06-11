//
//  ProductsController.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 09/06/2022.
//

import UIKit

class ProductsController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
         let layout = ProductsLayout()
         layout.delegate = self
         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.register(ProductsCell.self, forCellWithReuseIdentifier: ProductsCell.description())
         cv.backgroundColor = .white
         cv.showsVerticalScrollIndicator = false
         cv.contentInset.top = 5
         return cv
     }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = UIColor.systemGreen
        return indicator
    }()
    
    var presenter: ProductsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureCollectionView()
        view.backgroundColor = .clear
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.constrain(top: view.topAnchor,
                                 left: view.leftAnchor,
                                 bottom: view.bottomAnchor,
                                 right: view.rightAnchor,
                                 topConstraint: 0,
                                 leftConstraint: 0,
                                 bottomConstraint: 0,
                                 rightConstraint: 0,
                                 widthConstraint: 0,
                                 heightConstraint: 0)
    }
    
}

extension ProductsController: ProductsViewProtocol {
    func showIndector() {
        self.view.activityStartAnimating(activityColor: UIColor.darkBlue, backgroundColor: UIColor.black.withAlphaComponent(0.5))
    }
    
    func hideIndector() {
        self.view.activityStopAnimating()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func fetchingDataSuccess() {
        collectionView.reloadData()
    }
}

extension ProductsController: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getProductsCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCell.description(), for: indexPath) as? ProductsCell {
            presenter?.configure(cell: cell, for: indexPath.row)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectRow(index: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
            if contentOffsetY >= (scrollView.contentSize.height - scrollView.bounds.height) - 20  {
                guard !(presenter?.isLoading ?? true) else { return }
                presenter?.isLoading = true
                      presenter?.getData()

            }
    }
}

extension ProductsController: ProductsLayoutDelegate {
    func collectionView(_ CollectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath) -> CGFloat {
        return CGFloat((presenter?.productsImageHight(index: indexPath.row) ?? 100) + 200)
    }
}
