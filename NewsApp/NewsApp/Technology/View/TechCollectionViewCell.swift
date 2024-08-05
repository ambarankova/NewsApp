//
//  TechCollectionViewCell.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 05.08.2024.
//

import UIKit
import SnapKit

final class TechCollectionViewCell: UICollectionViewCell {
    
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "image")
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.text = ""
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = ""
        label.numberOfLines = 2
        
        return label
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func set(article: ArticleCellViewModel) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        
        if let data = article.imageData,
           let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "image")
        }
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        [imageView, titleLabel, descriptionLabel].forEach { addSubview($0) }
        
        setupConstraint()
    }
    
    private func setupConstraint() {
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(self.frame.height)
            make.top.leading.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(imageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview()
        }
    }
}

