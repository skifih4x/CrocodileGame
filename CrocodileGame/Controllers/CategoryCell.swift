//
//  CategoryCell.swift
//  CrocodileGame
//
//  Created by Леонид Турко on 18.04.2023.
//

import UIKit
import SnapKit

class CategoryCell: UITableViewCell {
  //  MARK: - Public Properties
  static let reuseIdentifier = String(describing: CategoryCell.self)
  
  //  MARK: - UI Elements
  private lazy var categoryImage: UIImageView = {
    let element = UIImageView()
    element.contentMode = .scaleAspectFit
    return element
  }()
  
  private lazy var categoryLabel: UILabel = {
    let element = UILabel()
    element.textAlignment = .center
    element.numberOfLines = 0
    element.font = UIFont.systemFont(ofSize: 22)
    element.textColor = .white
    return element
  }()
  
  private lazy var checkmarkImage: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(systemName: "checkmark.circle.fill")
    element.tintColor = .white
    element.backgroundColor = .clear
    element.layer.cornerRadius = 15
    element.clipsToBounds = true
    element.isHidden = true
    return element
  }()
  
  //  MARK: - Override Methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //  MARK: - Public Methods
  func configure(categoryPicture: String, categoryText: String) {
    categoryImage.image = UIImage(named: categoryPicture)
    categoryLabel.text = categoryText
  }
  
  func showImage() {
    checkmarkImage.isHidden.toggle()
  }
  
  func imageCheched() -> Bool {
    !checkmarkImage.isHidden
  }
}

//  MARK: -  Private Methods
extension CategoryCell {
  private func setViews() {
    addSubview(categoryImage)
    addSubview(categoryLabel)
    addSubview(checkmarkImage)
  }
  
  private func setConstraints() {
    checkmarkImage.snp.makeConstraints { make in
      make.trailing.equalToSuperview().inset(20)
      make.centerY.equalTo(categoryLabel.snp.centerY)
      make.height.width.equalTo(30)
    }
    
    categoryLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
    
    categoryImage.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(17)
      make.centerY.equalToSuperview()
      make.height.width.equalTo(56)
    }
  }
}
