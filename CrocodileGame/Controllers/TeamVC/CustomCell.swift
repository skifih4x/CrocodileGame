//
//  CustomCell.swift
//  CrocodileGame
//
//  Created by Леонид Турко on 17.04.2023.
//

import UIKit

class CustomCell: UITableViewCell {
  //  MARK: - Public Properties
  static let reuseIdentifier = String(describing: CustomCell.self)
  
  //  MARK: - UI Elements
  var playerImage: UIImageView = {
    let element = UIImageView()
    return element
  }()
  
  var playerLabel: UILabel = {
    let element = UILabel()
    element.textAlignment = .center
    element.numberOfLines = 0
    element.font = UIFont.systemFont(ofSize: 22)
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
}

//  MARK: -  Private Methods
extension CustomCell {
  private func setViews() {
    addSubview(playerImage)
    addSubview(playerLabel)
  }
  
  private func setConstraints() {
    playerLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
    
    playerImage.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(17)
      make.centerY.equalToSuperview()
    }
  }
}
