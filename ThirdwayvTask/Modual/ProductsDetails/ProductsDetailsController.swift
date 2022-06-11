//
//  ProductsDetailsController.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 11/06/2022.
//

import UIKit

class ProductsDetailsController: UIViewController {
    
    let imageView:UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        return image
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.mainGray
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor.mainGray
        return label
    }()
    
    private let container: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.contentMode = .scaleAspectFit
        stack.backgroundColor = .green
        stack.spacing = 10
        return stack
    }()
    
    var presenter: ProductsDetailsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hidesBarsOnTap = false
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        configure()
    }
    
    func configure() {
        
        view.addSubview(imageView)
        view.addSubview(priceLabel)
        view.addSubview(descriptionLabel)
        
        imageView.constrain(top: view.safeAreaLayoutGuide.topAnchor,
                            left: view.leftAnchor,
                            bottom: nil,
                            right: view.rightAnchor,
                            topConstraint: 20,
                            leftConstraint: 18,
                            bottomConstraint: 0,
                            rightConstraint: 18,
                            widthConstraint: 0,
                            heightConstraint: 0)
        
        priceLabel.constrain(top: imageView.bottomAnchor,
                             left: view.leftAnchor,
                             bottom: nil,
                             right: view.rightAnchor,
                             topConstraint: 18,
                             leftConstraint: 18,
                             bottomConstraint: 0,
                             rightConstraint: 18,
                             widthConstraint: 0,
                             heightConstraint: 20)
        
        descriptionLabel.constrain(top: priceLabel.bottomAnchor,
                                   left: view.leftAnchor,
                                   bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                   right: view.rightAnchor,
                                   topConstraint: 0,
                                   leftConstraint: 18,
                                   bottomConstraint: 0,
                                   rightConstraint: 18,
                                   widthConstraint: 0,
                                   heightConstraint: 200)
        
        
    }
    
}
extension ProductsDetailsController: productDetailsViewProtocol {
    func dispalyImage(imageURl: String) {
        imageView.downloaded(from: imageURl)
    }
    
    func dispalyPrice(price: String) {
        priceLabel.text = price + "$"
    }
    
    func dispalyDescription(description: String) {
        descriptionLabel.text = description
    }
}
