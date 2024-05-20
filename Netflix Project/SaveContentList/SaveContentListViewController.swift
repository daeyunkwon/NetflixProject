//
//  SaveContentListViewController.swift
//  Netflix Project
//
//  Created by 권대윤 on 5/16/24.
//

import UIKit

class SaveContentListViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var settingButton: UIButton!
    @IBOutlet var contentSearchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupTabBar()
        configureUI()
    }
    
    func setupNavi() {
        self.navigationItem.title = "저장한 콘텐츠 목록"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20)]
    }
    
    func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        
        self.tabBarController?.tabBar.standardAppearance = appearance
        self.tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
        self.tabBarController?.tabBar.tintColor = .white
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        designLabelUI()
        designImageViewUI()
        designButtonUI()
    }
    
    func designLabelUI() {
        titleLabel.text = """
        '나만의 자동저장'기능
        """
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        
        subTitleLabel.text = """
        취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다.
        디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요.
        """
        subTitleLabel.textColor = .lightGray
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.numberOfLines = 0
    }
    
    func designImageViewUI() {
        imageView.image = UIImage(named: "dummy")
        imageView.contentMode = .scaleAspectFill
    }
    
    func designButtonUI() {
        settingButton.setTitle("설정하기", for: .normal)
        settingButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        settingButton.setTitleColor(.white, for: .normal)
        settingButton.backgroundColor = .systemIndigo
        settingButton.layer.cornerRadius = 5
        
        contentSearchButton.setTitle("저장 가능한 콘텐츠 살펴보기", for: .normal)
        contentSearchButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        contentSearchButton.setTitleColor(.black, for: .normal)
        contentSearchButton.backgroundColor = .white
        contentSearchButton.layer.cornerRadius = 5
    }

}
