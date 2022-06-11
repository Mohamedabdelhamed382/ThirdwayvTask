//
//  ProductsLayout.swift
//  ThirdwayvTask
//
//  Created by MOHAMED ABD ELHAMED AHMED on 11/06/2022.
//
import UIKit

protocol ProductsLayoutDelegate: AnyObject {
    func collectionView(_ CollectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath) -> CGFloat
}

class ProductsLayout: UICollectionViewLayout {
    
    weak var delegate: ProductsLayoutDelegate!
    var numberOfColumns = 2
    var cellPadding: CGFloat = 5
    
    var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    var contentHight: CGFloat = 0
    
    override var collectionViewContentSize: CGSize{
        guard let collectionView = collectionView else { return CGSize.zero}
        let insets = collectionView.contentInset
        
        return CGSize(width: collectionView.bounds.width - (insets.left + insets.right), height: contentHight)
    }
    
    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        let columnWidth = collectionViewContentSize.width / CGFloat(numberOfColumns)
        var xPosition = [CGFloat]()
        for column in 0 ..< numberOfColumns{
            xPosition.append(CGFloat(column) * columnWidth)
        }
        
        var column = 0
        var yPosition = [CGFloat](repeating: 0, count: numberOfColumns)
        
        for item in 0 ..< collectionView.numberOfItems(inSection: 0){
            let indexPath = IndexPath(item: item, section: 0)
            
            let photoHeight = delegate.collectionView(collectionView, heightForImageAtIndexPath: indexPath)
            let height = cellPadding * 2 + photoHeight
            let frame = CGRect(x: xPosition[column], y: yPosition[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cachedAttributes.append(attributes)
            
            contentHight = max(contentHight, frame.maxY)
            yPosition[column] = yPosition[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1): 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cachedAttributes {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedAttributes[indexPath.item]
    }
}
