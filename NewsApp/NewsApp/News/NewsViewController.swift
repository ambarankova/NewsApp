//
//  NewsViewController.swift
//  NewsApp
//
//  Created by Анастасия Ахановская on 11.07.2024.
//

import UIKit
import SnapKit

final class NewsViewController: UIViewController {
    
    // MARK: - GUI Variables
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        label.numberOfLines = 3
        
        return label
    }()
    
    private lazy var newsImage: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var textView: UITextView = {
        let text = UITextView()
        
        text.isEditable = false
        text.font = .systemFont(ofSize: 25)
        
        return text
    }()
    
    // MARK: - Properties
    private let viewModel: NewsViewModelProtocol
    
    // MARK: - Life Cycle
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        [dateLabel, titleLabel, newsImage, textView].forEach { view.addSubview($0) }
        
        view.backgroundColor = .white
        titleLabel.text = viewModel.title
        textView.text = viewModel.description
        dateLabel.text = viewModel.date
    
        if let data = viewModel.imageData,
           let image = UIImage(data: data) {
            newsImage.image = image
        } else {
            newsImage.image = UIImage(named: "image")
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.trailing.leading.equalToSuperview().inset(10)
        }
        
        newsImage.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(view.snp.width)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(newsImage.snp.bottom).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }
}
