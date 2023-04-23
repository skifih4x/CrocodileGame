//
//  TeamLeadersViewController.swift
//  CrocodileGame
//
//  Created by Николай on 19.04.2023.
//

import Foundation
import UIKit

class TeamLeadersViewController: UIViewController {
    
    var teams = ["Ковбои", "Стройняшки", "Красотки","Ковбои", "Стройняшки", "Красотки","Ковбои", "Стройняшки", "Красотки","Ковбои"]
//    var points = String(5)
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("Очистить", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.6549019608, blue: 0.1882352941, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clean), for: .touchUpInside)
        return button
        }()
    
    private lazy var labelResult: UILabel = {
        let label = UILabel()
        label.text = "Список лидеров"
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
        tableView.isScrollEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
            setConstraints()
            
        }

        private func setupView () {
            tableViewTeam.dataSource = self
            tableViewTeam.delegate = self
            view.addSubview(backgroundImage)
            view.addSubview(labelResult)
            view.addSubview(tableViewTeam)
            view.addSubview(startButton)
        }
        
        @objc func playAgain () {
            let destinationViewController = TeamViewController()
            self.navigationController?.pushViewController(destinationViewController, animated: true)
        }
    @objc func clean () {
        Base.shared.full.removeAll()
        tableViewTeam.reloadData()
        }
    }


    extension TeamLeadersViewController {
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
                tableViewTeam.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableViewTeam.heightAnchor.constraint(equalToConstant: CGFloat(5*130)),

                startButton.heightAnchor.constraint(equalToConstant: 40),
                startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            ])
        }
    }

    extension TeamLeadersViewController: UITableViewDelegate, UITableViewDataSource {
        
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        team.count
    //    }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            Base.shared.full.count

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
                let team = Base.shared.full[indexPath.section]
                cell.imageLogo.image = UIImage(named: teams.randomElement() ?? "")
                cell.labelNameTeam.text = team.name
                cell.labelCount.text = String(team.points)

            }
            return cell
          }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          1
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("aa")
    //      tableView.deselectRow(at: indexPath, animated: true)
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
          let hearderView = UIView()
          return hearderView
        }

    }


