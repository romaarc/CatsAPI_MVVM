//
//  CatDetailViewController.swift
//  CatsAPI_MVVM
//
//  Created by Roman Gorshkov on 25.12.2021.
//

import UIKit

class CatDetailViewController: UIViewController {
    
    private var viewModel: CatDetailViewModelProtocol
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var catDetailHeaderView = CatDetailHeaderView()
    
    init(viewModel: CatDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
    }
    
    private func setupNavBar() {
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        title = viewModel.cat.name
    }
}

private extension CatDetailViewController {
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let contentViewHeightAnchor = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        contentViewHeightAnchor.priority = .defaultLow
        contentViewHeightAnchor.isActive = true
        
        contentView.backgroundColor = .white
    }
    
    private func setupHeaderView() {
        contentView.addSubview(catDetailHeaderView)
        NSLayoutConstraint.activate([
            catDetailHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            catDetailHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            catDetailHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            catDetailHeaderView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        catDetailHeaderView.update(viewModel: self.viewModel)
    }
    
    private func setupUI() {
        setupScrollView()
        setupHeaderView()
    }
}
