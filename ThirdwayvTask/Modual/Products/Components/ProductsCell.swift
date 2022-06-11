//
//  ProductsCell.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 11/06/2022.
//

import UIKit

class ProductsCell: UICollectionViewCell,productCellViewProtocol {
    
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
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.mainGray
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor.mainGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellViewSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellViewSetup() {
        
        addSubview(imageView)
        addSubview(priceLabel)
        addSubview(descriptionLabel)
        
       imageView.constrain(top: topAnchor,
                           left: leftAnchor,
                           bottom: nil,
                           right: rightAnchor,
                           topConstraint: 0,
                           leftConstraint: 0,
                           bottomConstraint: 0,
                           rightConstraint: 0,
                           widthConstraint: 0,
                           heightConstraint: 0)
        
        priceLabel.constrain(top: imageView.bottomAnchor,
                          left: leftAnchor,
                          bottom: nil,
                          right: rightAnchor,
                          topConstraint: 0,
                          leftConstraint: 0,
                          bottomConstraint: 0,
                          rightConstraint: 0,
                          widthConstraint: 0,
                          heightConstraint: 50)
        
        descriptionLabel.constrain(top: priceLabel.bottomAnchor,
                                   left: leftAnchor,
                                   bottom: bottomAnchor,
                                   right: rightAnchor,
                                   topConstraint: 0,
                                   leftConstraint: 0,
                                   bottomConstraint: 0,
                                   rightConstraint: 0,
                                   widthConstraint: 0,
                                   heightConstraint: 100)
    }
    
    func dispalyImage(imageURl: String) {
        imageView.downloaded(from: imageURl)
    }
    
    func dispalyPrice(price: String) {
        priceLabel.text = price
    }
    
    func dispalyDescription(description: String) {
        descriptionLabel.text = description
    }
    
}
