//
//  FilterCollectionViewCell.swift
//  GaryIOS
//
//  Created by 정종문 on 2021/02/06.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    static let identifier = "filterCell"
    
    private let filterArray = Array(FilterColorEffect.allCases)
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView.frame = CGRect(x: 5,
                                      y: 5,
                                      width: contentView.frame.size.width - 10,
                                      height: contentView.frame.size.height - 100)
        self.label.frame = CGRect(x: 5,
                                  y: self.imageView.frame.height + 5,
                                  width: self.imageView.frame.width,
                                  height: 30)
    }
    
    public func configure(label: String, index: Int) {
        guard let image: UIImage = UIImage(named: "ex_image") else {
            return
        }
        let filterImage = Filters().applyFilter(image,
                                                filtername: filterArray[index].rawValue,
                                                value: 0.5)
        self.imageView.image = filterImage
        self.label.text = label
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
}
