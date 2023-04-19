//
//  TeamViewController.swift
//  CrocodileGame
//
//  Created by Артем Орлов on 16.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class TeamViewController: UIViewController {
  
  //  MARK: - UI
  private lazy var background: UIImageView = {
    let element = UIImageView()
    element.image = UIImage(named: "background")
    return element
  }()
  
  private lazy var textLabel: UILabel = {
    let element = UILabel()
    element.text = "Кто играет?"
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
    element.register(CustomCell.self, forCellReuseIdentifier: CustomCell.reuseIdentifier)
    element.layer.cornerRadius = 10
    return element
  }()
  
  private lazy var readyButton: UIButton = {
    let element = UIButton(type: .system)
    element.backgroundColor = #colorLiteral(red: 0.4534765482, green: 0.6565048099, blue: 0.187305212, alpha: 1)
    element.setTitle("Игроки готовы", for: .normal)
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
    setDelegates()
  }
}

//  MARK: - UITableViewDataSource, UITableViewDelegate
extension TeamViewController: UITableViewDataSource, UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reuseIdentifier, for: indexPath) as? CustomCell else { return UITableViewCell() }
    cell.layer.cornerRadius = 10
    cell.clipsToBounds = true
    
    switch indexPath.section {
    case 0:
      cell.configure(playerName: "Ковбои", imageName: "people")
    default:
      cell.configure(playerName: "Стройняшки", imageName: "food")
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    10
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let hearderView = UIView()
    hearderView.backgroundColor = .clear
    return hearderView
  }
  
}

//  MARK: -  Private Methods
extension TeamViewController {
  private func setDelegates() {
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  private func setViews() {
    view.addSubview(background)
    view.addSubview(arrowButton)
    view.addSubview(textLabel)
    view.addSubview(tableView)
    view.addSubview(readyButton)
  }
  
  private func setConstraints() {
    background.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    arrowButton.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(14)
      make.centerY.equalTo(textLabel.snp.centerY)
    }
    
    textLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(view.snp_topMargin)
    }
    
    tableView.snp.makeConstraints { make in
      make.top.equalTo(textLabel.snp.bottom).offset(16)
      make.leading.trailing.equalToSuperview().inset(14)
      make.height.equalToSuperview().multipliedBy(0.5)
    }
    
    readyButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(14)
      make.bottom.equalToSuperview().inset(62)
      make.height.equalTo(63)
    }
  }
}

//  MARK: - Show Canvas
struct ContentViewController: UIViewControllerRepresentable {
  
  typealias UIViewControllerType = TeamViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    return TeamViewController()
  }
  
  func updateUIViewController(_ uiViewController: TeamViewController, context: Context) {}
}

struct ContentViewController_Previews: PreviewProvider {
  static var previews: some View {
    ContentViewController()
      .edgesIgnoringSafeArea(.all)
      .colorScheme(.light) // or .dark
  }
}
