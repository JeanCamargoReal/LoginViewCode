//
//  HomeViewController.swift
//  LoginViewCode
//
//  Created by Jean Camargo on 21/09/21.
//

import UIKit 

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    
    var dataUser: [DataUser] = [
        DataUser(name: "Jean", nameImage: "menino1"),
        DataUser(name: "Karina", nameImage: "menina1"),
        DataUser(name: "Jolie", nameImage: "menina2"),
    ]
    
    var dataSport: [Sport] = [
        Sport(name: "Corrida", nameImage: "corrida"),
        Sport(name: "Ciclismo", nameImage: "ciclismo"),
        Sport(name: "Natação", nameImage: "natacao"),
        Sport(name: "Luta", nameImage: "karate"),
        Sport(name: "Yoga", nameImage: "yoga")
    ]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            
            cell?.dataCollection(data: self.dataSport)
            
            return cell ?? UITableViewCell()
        }
        
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        
        cell?.setUpCell(data: self.dataUser[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
