//
//  NewHotViewController.swift
//  Netflix Project
//
//  Created by 권대윤 on 5/16/24.
//

import UIKit

class NewHotViewController: UIViewController {
    
    //MARK: 버튼 관련 사항
    //plain < ios15+
    //default < legacy
    //default 스타일을 다루는 버튼 코드와
    //plain 스타일을 다루는 버튼 코드가 다르다.
    //이미지 렌더링모드: template(형태만따옴) vs original(원본)
    
    @IBOutlet var backView: UIView!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchTextField: UITextField!
    
    @IBOutlet var comingSoonButton: UIButton!
    @IBOutlet var popularityButton: UIButton!
    @IBOutlet var topTenButton: UIButton!
    
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var subCommentLabel: UILabel!
    
    lazy var buttons: [UIButton] = [comingSoonButton, popularityButton, topTenButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupTabBar()
        configureUI()
    }
    
    func setupNavi() {
        self.navigationItem.title = "NEW & HOT 검색"
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
        
        backView.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
        backView.layer.cornerRadius = 5
        
        searchButton.tintColor = .systemGray
        
        searchTextField.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
        searchTextField.tintColor = .white
        searchTextField.borderStyle = .none
        searchTextField.textColor = .white
        searchTextField.attributedPlaceholder = NSAttributedString(string: "게임, 시리즈, 영화를 검색하세요...", attributes: [.foregroundColor: UIColor.lightGray])
        
        comingSoonButton.backgroundColor = .white
        comingSoonButton.layer.cornerRadius = 17
        comingSoonButton.setTitleColor(.black, for: .normal)
        comingSoonButton.setTitle("공개 예정", for: .normal)
        comingSoonButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
        comingSoonButton.setImage(UIImage.blue.withRenderingMode(.alwaysOriginal), for: .normal)
        
        popularityButton.backgroundColor = .clear
        popularityButton.layer.cornerRadius = 17
        popularityButton.setTitleColor(.white, for: .normal)
        popularityButton.setTitle("모두의 인기 콘텐츠", for: .normal)
        popularityButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
        popularityButton.setImage(UIImage.turquoise, for: .normal)
        
        topTenButton.backgroundColor = .clear
        topTenButton.layer.cornerRadius = 17
        topTenButton.setTitleColor(.white, for: .normal)
        topTenButton.setTitle("TOP 10 시리즈", for: .normal)
        topTenButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
        topTenButton.setImage(UIImage.pink, for: .normal)
        
        commentLabel.text = "이런! 찾으시는 작품이 없습니다."
        commentLabel.textColor = .white
        commentLabel.font = .boldSystemFont(ofSize: 25)
        commentLabel.textAlignment = .center
        
        subCommentLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        subCommentLabel.textColor = .lightGray
        subCommentLabel.textAlignment = .center
        subCommentLabel.font = .systemFont(ofSize: 15)
    }
    
    func updateColorButton(sender: UIButton) {
        buttons.forEach { button in
            if button != sender {
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .clear
            } else {
                button.setTitleColor(.black, for: .normal)
                button.backgroundColor = .white
            }
        }
    }
    
    @IBAction func comingSoonButtonTapped(_ sender: UIButton) {
        updateColorButton(sender: sender)
        
        commentLabel.text = "이런! 찾으시는 작품이 없습니다."
        subCommentLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
    }
    
    @IBAction func popularityButtonTapped(_ sender: UIButton) {
        updateColorButton(sender: sender)
        
        commentLabel.text = "이런! 인기 콘텐츠가 없습니다."
        subCommentLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
    }
    
    @IBAction func topTenButtonTapped(_ sender: UIButton) {
        updateColorButton(sender: sender)
        
        commentLabel.text = "이런! TOP 10 시리즈가 없습니다."
        subCommentLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
    }
}
