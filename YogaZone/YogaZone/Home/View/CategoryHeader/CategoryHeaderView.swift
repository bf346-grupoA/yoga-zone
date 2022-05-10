//
//  CategoryHeader.swift
//  CompositionalLayout
//
//  Created by Philippe Muniz Gomes on 17/03/22.
//
import UIKit

class CategoryHeaderView: UICollectionReusableView {
    static let identifier: String = "CategoryHeaderView"
    
    static func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-SemiBold", size: 20)
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    func setupHeaderTitle(title: String) {
        label.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
