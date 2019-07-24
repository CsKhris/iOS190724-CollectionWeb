//
//  ViewController.swift
//  DataDownload190724
//
//  Created by Ci on 24/07/2019.
//  Copyright © 2019 Ci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var tView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // https://www.apple.com 의 Text 가져오기
        var url = URL(string: "https://www.apple.com/kr/pro-display-xdr/")
        
        // Web 에서 Data 를 byte 배열로 가져오기
        // 예외처리를 강제하기 때문에 try! 를 이용하여 "예외처리를 하지 않겠다." 라고 명시 합니다.
        let appleText = try! Data(contentsOf: url!)
        
        // byte 배열을 문자열로 만들기
        let apple = String(data: appleText, encoding: .utf8)
        
        // Text View 에 출력
        tView.text = apple
        
        // Image File 의 URL 생성
        url = URL(string: "http://image.chosun.com/sitedata/image/201904/26/2019042603385_0.jpg")
        
        let irin = try! Data(contentsOf: url!)
        
        let image = UIImage(data: irin)
        
        imgView.image = image
    }
}
