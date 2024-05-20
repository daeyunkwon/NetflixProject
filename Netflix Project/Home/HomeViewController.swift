//
//  HomeViewController.swift
//  Netflix Project
//
//  Created by 권대윤 on 5/16/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var mainImageView: UIImageView!
    
    @IBOutlet var keywordLabel: UILabel!
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var favoriteListButton: UIButton!
    
    @IBOutlet var comingUpLabel: UILabel!
    
    @IBOutlet var comingUpContentLeftImageView: UIImageView!
    @IBOutlet var comingUpContentLeftTopMarkImageView: UIImageView!
    
    @IBOutlet var comingUpContentCenterImageView: UIImageView!
    @IBOutlet var comingUpContentCenterTopMarkImageView: UIImageView!
    
    @IBOutlet var comingUpContentRightImageView: UIImageView!
    @IBOutlet var comingUpContentRightTopMarkImageView: UIImageView!
    
    var movieNames: [String] = ["극한직업", "노량", "더퍼스트슬램덩크", "도둑들", "명량", "밀수", "범죄도시3", "베테랑", "부산행", "서울의봄", "스즈메의문단속", "신과함께인과연", "신과함께죄와벌", "아바타", "아바타물의길", "알라딘", "암살", "어벤져스엔드게임", "오펜하이머", "왕의남자", "육사오", "콘크리트유토피아", "태극기휘날리며", "택시운전사", "해운대"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupTabBar()
        configureUI()
    }
    
    func setupNavi() {
        self.navigationItem.title = "고래밥님"
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
        
        mainImageView.image = UIImage.명량
        mainImageView.layer.cornerRadius = 10
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.backgroundColor = .gray
        
        keywordLabel.text = "응원하고픈 • 흥미진진 • 사극 • 전투 • 한국 작품"
        keywordLabel.textColor = .white
        keywordLabel.textAlignment = .center
        
        configureButton(playButton, backgroundColor: .white, text: "재생", imageName: "play.fill", fontSize: 14, foregroundColor: .black)
        configureButton(favoriteListButton, backgroundColor: UIColor(red: 0.19, green: 0.19, blue: 0.18, alpha: 1.00), text: "내가 찜한 리스트", imageName: "plus", fontSize: 14, foregroundColor: .white)
        
        comingUpLabel.text = "지금 뜨는 콘텐츠"
        comingUpLabel.textColor = .white
        
        comingUpContentLeftImageView.image = UIImage.극한직업
        comingUpContentLeftImageView.contentMode = .scaleAspectFill
        comingUpContentLeftImageView.layer.cornerRadius = 5
        
        comingUpContentCenterImageView.image = UIImage.노량
        comingUpContentCenterImageView.contentMode = .scaleAspectFill
        comingUpContentCenterImageView.layer.cornerRadius = 5
        
        comingUpContentRightImageView.image = UIImage.더퍼스트슬램덩크
        comingUpContentRightImageView.contentMode = .scaleAspectFill
        comingUpContentRightImageView.layer.cornerRadius = 5
    }
    
    func configureButton(_ button: UIButton, backgroundColor: UIColor, text: String, imageName: String ,fontSize: CGFloat, foregroundColor: UIColor) {
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 5
        button.setTitle(text, for: .normal)
        button.setAttributedTitle(.init(string: text, attributes: [.font: UIFont.boldSystemFont(ofSize: fontSize), .foregroundColor: foregroundColor]), for: .normal)
        button.setAttributedTitle(.init(string: text, attributes: [.font: UIFont.boldSystemFont(ofSize: fontSize), .foregroundColor: foregroundColor]), for: .highlighted)
        button.setImage(UIImage(systemName: imageName), for: .normal)
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseForegroundColor = foregroundColor
        button.configuration = buttonConfiguration
    }
    
    func randomMovieNameWithoutDuplicates(previousMovieNames: [String]) -> String {
        var randomMovieName = movieNames.randomElement() ?? ""
        
        while true {
            var count = 0
            
            for previousMovieName in previousMovieNames {
                if previousMovieName != randomMovieName {
                    count += 1
                }
            }
            
            if previousMovieNames.count == count {
                return randomMovieName
            }
            
            randomMovieName = movieNames.randomElement() ?? ""
        }
    }
    
    func randomlyDisplayTopTenMark(with imageView: UIImageView) {
        let random: [Bool] = [true, false]
        
        let isShowTopTenMark = random.randomElement() ?? false
        if isShowTopTenMark {
            imageView.image = UIImage.top10Badge
        } else {
            imageView.image = nil
        }
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        var previousMovieNames: [String] = []
        
        let movieNameForMain = movieNames.randomElement() ?? ""
        mainImageView.image = UIImage(named: movieNameForMain)
        previousMovieNames.append(movieNameForMain)
        
        let movieNameForComingUpContentLeft = randomMovieNameWithoutDuplicates(previousMovieNames: previousMovieNames)
        comingUpContentLeftImageView.image = UIImage(named: movieNameForComingUpContentLeft)
        previousMovieNames.append(movieNameForComingUpContentLeft)
        
        let movieNameForComingUpContentCenter = randomMovieNameWithoutDuplicates(previousMovieNames: previousMovieNames)
        comingUpContentCenterImageView.image = UIImage(named: movieNameForComingUpContentCenter)
        previousMovieNames.append(movieNameForComingUpContentCenter)
        
        let movieNameForComingUpContentRight = randomMovieNameWithoutDuplicates(previousMovieNames: previousMovieNames)
        comingUpContentRightImageView.image = UIImage(named: movieNameForComingUpContentRight)
        
        randomlyDisplayTopTenMark(with: comingUpContentLeftTopMarkImageView)
        randomlyDisplayTopTenMark(with: comingUpContentCenterTopMarkImageView)
        randomlyDisplayTopTenMark(with: comingUpContentRightTopMarkImageView)
    }
}
