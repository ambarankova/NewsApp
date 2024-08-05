//
//  BusinessViewController.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 09.07.2024.
//

import UIKit
import SnapKit

class BusinessViewController: UIViewController {

    // MARK: - GUI Variables
    private lazy var collectionView: UICollectionView = {
        let layaout = UICollectionViewFlowLayout()
        
        
        layaout.minimumLineSpacing = 5
        layaout.minimumInteritemSpacing = 5
        layaout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0,
                                                            y: 0,
                                                            width: view.frame.width,
                                                            height: view.frame.height),
                                              collectionViewLayout: layaout)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    // MARK: - Properties
    private var viewModel: BusinessViewModelProtocol
    
    // MARK: - Life Cycle
    init(viewModel: BusinessViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        collectionView.register(GeneralCollectionViewCell.self, forCellWithReuseIdentifier: "GeneralCollectionViewCell")
        
        collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: "DetailsCollectionViewCell")
        
        setupUI()
        
        self.setupViewModel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    // MARK: - Private Methods

    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel.reloadCell = { [weak self] row in
            row == 0 ?
            self?.collectionView.reloadItems(at: [IndexPath(row: row, section: 0)]) :
            self?.collectionView.reloadItems(at: [IndexPath.init(row: row-1, section: 1)])
        }
        
        viewModel.showError = { error in
            // TODO: show alert
            print(error)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        [collectionView].forEach { view.addSubview($0) }
        
        setupContraints()
    }
    
    private func setupContraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension BusinessViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : (viewModel.numberOfCells - 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let article = viewModel.getArticle(for: indexPath.row)
        
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCollectionViewCell", for: indexPath) as? GeneralCollectionViewCell else { return UICollectionViewCell() }
            
            cell.set(article: article)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionViewCell", for: indexPath) as? DetailsCollectionViewCell else { return UICollectionViewCell() }
            
            cell.set(article: article)
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate
extension BusinessViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = viewModel.getArticle(for: indexPath.row)
        
        navigationController?.pushViewController(NewsViewController(viewModel: NewsViewModel(article: article)), animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BusinessViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let firstSectionItemSize = CGSize(width: width, height: width)
        let secondSectionItemSize = CGSize(width: width, height: 100)
        
        return indexPath.section == 0 ? firstSectionItemSize : secondSectionItemSize
    }
}
