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
        
        label.text = "11.07.2024"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = newsTitle
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var newsImage: UIImageView = {
        let image = UIImageView()
        
        image.image = inditexImage
        
        return image
    }()
    
    private lazy var textView: UITextView = {
        let text = UITextView()
        
        text.text = newsText
        text.isEditable = false
        text.font = .systemFont(ofSize: 25)
        
        return text
    }()
    
    // MARK: - Properties
    private let date = "11.07.2024"
    private let inditexImage = UIImage(named: "news1")
    private let newsTitle = "Inditex 2024"
    private let newsText = """
Испанская текстильная группа Inditex объявила о своем вхождении в капитал Galy, стартапа, основанного в 2019 году в США для развития инновационного процесса выращивания хлопка в лаборатории с целью производства экологически чистых материалов. Цель, которую преследует Inditex, состоит в том, чтобы к 2030 году 100% ее сырья, ее волокон, стали более устойчивыми. В 2023 уже 50% сырья, используемого марками группы являются переработанными или органическими. Испанская текстильная группа Inditex объявила о своем вхождении в капитал Galy, стартапа, основанного в 2019 году в США для развития инновационного процесса выращивания хлопка в лаборатории с целью производства экологически чистых материалов. Цель, которую преследует Inditex, состоит в том, чтобы к 2030 году 100% ее сырья, ее волокон, стали более устойчивыми. В 2023 уже 50% сырья, используемого марками группы являются переработанными или органическими.
"""
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        [dateLabel, titleLabel, newsImage, textView].forEach { view.addSubview($0) }
        
        view.backgroundColor = .white
        setupConstraints()
    }
    
    private func setupConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(100)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
        }
        
        newsImage.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(15)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(newsImage.snp.bottom).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }
    
}
