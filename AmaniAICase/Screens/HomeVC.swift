//
//  HomeVC.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 4.03.2024.
//

import UIKit

class HomeVC: UIViewController {
    
    var viewModel: HomeViewModel?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

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
        
        setupUI()
        configureUI()
    }
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(idLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            idLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureUI() {
        guard let viewModel = viewModel else { return }
        
        // Update UI with the first image from the viewModel
        if let firstImage = viewModel.images.first {
            if let imageURL = URL(string: firstImage.base64) {
                imageView.load(url: imageURL)
            }
            
            titleLabel.text = firstImage.title
            idLabel.text = String(firstImage.id)
        }
    }
    
    @objc func goToList() {
        let listVC = ListVC()
        navigationController?.pushViewController(listVC, animated: true)
    }
}
