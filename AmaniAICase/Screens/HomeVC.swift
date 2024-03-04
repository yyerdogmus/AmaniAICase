//
//  HomeVC.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 4.03.2024.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Home"
        
        let listButton = UIButton(type: .system)
        listButton.setTitle("Go to List", for: .normal)
        listButton.addTarget(self, action: #selector(goToList), for: .touchUpInside)
        listButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listButton)
        
        NSLayoutConstraint.activate([
            listButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func goToList() {
        let listVC = ListVC()
        navigationController?.pushViewController(listVC, animated: true)
    }
}
