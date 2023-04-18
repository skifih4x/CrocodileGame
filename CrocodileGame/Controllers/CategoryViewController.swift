//
//  CategoryViewController.swift
//  CrocodileGame
//
//  Created by Артем Орлов on 16.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class CategoryViewController: UIViewController {
  //  MARK: - UI
  private lazy var background: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "background")
    return element
  }()
  
  private lazy var textLabel: UILabel = {
    let element = UILabel()
    element.text = "Категории"
    element.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    return element
  }()
  
  private lazy var arrowButton: UIButton = {
    let element = UIButton(type: .system)
    let image = #imageLiteral(resourceName: "Arrow")
    element.setImage(image, for: .normal)
    return element
  }()
  
  private lazy var tableView: UITableView = {
    let element = UITableView()
    element.rowHeight = 120
    element.backgroundColor = .clear
    element.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.reuseIdentifier)
    element.layer.cornerRadius = 10
    return element
  }()
  
  private lazy var startButton: UIButton = {
    let element = UIButton(type: .system)
    element.backgroundColor = #colorLiteral(red: 0.4534765482, green: 0.6565048099, blue: 0.187305212, alpha: 1)
    element.setTitle("Начать игру", for: .normal)
    element.tintColor = .white
    element.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    element.layer.cornerRadius = 10
    return element
  }()
  
  //  MARK: - Override Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    setConstraints()
    tableView.dataSource = self
    tableView.delegate = self
  }
}

//  MARK: - UITableViewDataSource, UITableViewDelegate
extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    4
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else { return UITableViewCell() }
    cell.layer.cornerRadius = 10
    
    switch indexPath.section {
    case 0:
      cell.backgroundColor = #colorLiteral(red: 0.68447721, green: 0.2047993839, blue: 0.7666496634, alpha: 1)
      cell.configure(categoryPicture: "animal", categoryText: "Животные")
    case 1:
      cell.backgroundColor = #colorLiteral(red: 0.7802433372, green: 0.8300433755, blue: 0.1574678123, alpha: 1)
      cell.configure(categoryPicture: "food", categoryText: "Еда")
    case 2:
      cell.backgroundColor = #colorLiteral(red: 0.141972065, green: 0.5345878601, blue: 0.8460460305, alpha: 1)
      cell.configure(categoryPicture: "people", categoryText: "Личности")
    default:
      let color = #colorLiteral(red: 0.9035993218, green: 0.2759390175, blue: 0.2722260058, alpha: 1)
      cell.backgroundColor = color
      cell.configure(categoryPicture: "hobby", categoryText: "Хобби")
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let hearderView = UIView()
    return hearderView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    1
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    guard let cell = tableView.cellForRow(at: indexPath) as? CategoryCell else { return }
    cell.showImage()
  }
}

//  MARK: -  Private Methods
extension CategoryViewController {
  private func setViews() {
    view.addSubview(background)
    view.addSubview(arrowButton)
    view.addSubview(textLabel)
    view.addSubview(tableView)
    view.addSubview(startButton)
  }
  
  private func setConstraints() {
    background.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    arrowButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(16)
      make.centerY.equalTo(textLabel.snp.centerY)
    }
    
    textLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(view.snp_topMargin)
    }
    
    tableView.snp.makeConstraints { make in
      make.top.equalTo(textLabel.snp.bottom).offset(36)
      make.leading.trailing.equalToSuperview().inset(14)
      make.bottom.greaterThanOrEqualTo(startButton.snp.top)
    }
    
    startButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(14)
      make.bottom.equalToSuperview().inset(62)
      make.height.equalTo(63)
    }
  }
}

//  MARK: - Show Canvas
struct NewContentViewController: UIViewControllerRepresentable {
  
  typealias UIViewControllerType = CategoryViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    return CategoryViewController()
  }
  
  func updateUIViewController(_ uiViewController: CategoryViewController, context: Context) {}
}

struct NewContentViewController_Previews: PreviewProvider {
  static var previews: some View {
    NewContentViewController()
      .edgesIgnoringSafeArea(.all)
      .colorScheme(.light) // or .dark
  }
}
