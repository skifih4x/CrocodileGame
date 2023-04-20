//
//  ResultGameViewController.swift
//  CrocodileGame
//
//  Created by Артем Орлов on 16.04.2023.
//

import UIKit

class ResultGameViewController: UIViewController {
    
    var teami = ["Ковбои", "Стройняшки", "Красотки"]
    
    private lazy var labelResult: UILabel = {
       let label = UILabel()
        label.text = "Результаты"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backgroundImage: UIImageView = .background
    
    private lazy var tableViewTeam: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewTeamCell.self, forCellReuseIdentifier: "team")
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = .clear
        tableView.rowHeight = 100
        tableView.layer.cornerRadius = 10
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var playAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("Начать заново", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6549019608, blue: 0.1882352941, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        
    }

    private func setupView () {
        self.navigationItem.hidesBackButton = true
        tableViewTeam.dataSource = self
        tableViewTeam.delegate = self
        view.addSubview(backgroundImage)
        view.addSubview(labelResult)
        view.addSubview(tableViewTeam)
        view.addSubview(playAgainButton)
    }
    
    @objc func playAgain () {
        
        self.navigationController?.popToRootViewController(animated: true)
    }

}

extension ResultGameViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            labelResult.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            labelResult.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableViewTeam.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            tableViewTeam.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableViewTeam.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableViewTeam.bottomAnchor.constraint(equalTo: playAgainButton.topAnchor, constant: -20),
            tableViewTeam.heightAnchor.constraint(equalToConstant: 80),

            playAgainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            playAgainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            playAgainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            playAgainButton.heightAnchor.constraint(equalToConstant: 70)
            
        ])
    }
}

extension ResultGameViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        team.count
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        teams.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "team", for: indexPath) as? TableViewTeamCell else {
            return UITableViewCell()
        }
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true

        switch indexPath.section {
            
        default:
            let team = teams[indexPath.section]
            cell.imageLogo.image = team.avatarName
            cell.labelNameTeam.text = team.name
            cell.labelCount.text = String(team.points)

        }
        return cell
      }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let hearderView = UIView()
      return hearderView
    }

}
