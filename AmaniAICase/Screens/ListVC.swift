//
//  ListVC.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 4.03.2024.
//

import UIKit

class ListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "List"
        
        let detailButton = UIButton(type: .system)
        detailButton.setTitle("Go to Detail", for: .normal)
        detailButton.addTarget(self, action: #selector(goToDetail), for: .touchUpInside)
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailButton)
        
        NSLayoutConstraint.activate([
            detailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func goToDetail() {
        let detailVC = DetailVC()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
