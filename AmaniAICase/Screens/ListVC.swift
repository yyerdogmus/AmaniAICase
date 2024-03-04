//
//  ListVC.swift
//  AmaniAICase
//
//  Created by Y. Yılmaz Erdoğmuş on 4.03.2024.
//
import UIKit

class ListVC: UIViewController {
    
    private var collectionView: UICollectionView!
    private var viewModel: ListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "List"
        
        setupCollectionView()
        setupViewModel()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setupViewModel() {
        viewModel = ListViewModel()
        viewModel?.fetchData(completion: { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        })
    }
}

extension ListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfImages ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        if let image = viewModel?.getImage(at: indexPath.item) {
            cell.configure(with: image)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let image = viewModel?.getImage(at: indexPath.item) else { return }
        
        let detailViewModel = DetailViewModel(image: image)
        let detailVC = DetailVC()
        detailVC.viewModel = detailViewModel
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

extension ListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 20) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}
