//
//  HomeScreen.swift
//  LoginViewCode
//
//  Created by Jean Camargo on 21/09/21.
//

import UIKit

class HomeScreen: UIView {
    
    // ------------------------------------------------------------------
    // MARK: - elementos
    // ------------------------------------------------------------------
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        tableView.register(SportTableViewCell.self, forCellReuseIdentifier: SportTableViewCell.identifier)
        
        return tableView
    }()

    // ------------------------------------------------------------------
    // MARK: - init
    // ------------------------------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.addSubView()
        self.setUpConstraints()
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    private func configBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 115/255, blue: 104/255, alpha: 1.0)
    }
    
    func addSubView() {
        self.addSubview(self.tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
