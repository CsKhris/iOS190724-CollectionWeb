//
//  DetailViewController.swift
//  HaniXMLParsing190724
//
//  Created by Ci on 24/07/2019.
//  Copyright © 2019 Ci. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var addr : String! // 당장 Data 가 없기 때문에 nil 을 저장할 수 있도록 만드는 방법 - 권장하는 방법 입니다. (nil 을 대입하면 '소멸자'를 호출하기 때문에 Memory 를 정리 해줍니다.)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "미래 & 과학"
        
        let url = URL(string:addr)
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
