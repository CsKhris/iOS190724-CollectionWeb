//
//  RootViewController.swift
//  HaniXMLParsing190724
//
//  Created by Ci on 24/07/2019.
//  Copyright © 2019 Ci. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {

    // 기사 제목과 기사 Link 를 저장할 배열 생성
    var titles : [String] = [String]()
    var links : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "한겨레 과학"
        // XML Data 가 있는 URL 생성
        let url = "http://www.hani.co.kr/rss/science/"
        
        // XML Parser Instance 생성
        let xmlParser = XMLParser(contentsOf: URL(string:url)!)
        
        // Parsing 을 수행할 Instance 생성
        xmlParser?.delegate = self
        
        // Parsing 시작
        let result = xmlParser?.parse()
        if result == true{
            NSLog("Parsing 성공")
        }else{
            NSLog("Parsing 실패")
        }
        
    }

    // MARK: - Table view data source
    
    // Section 의 개수를 설정하는 Method
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Section 별 행의 개수를 설정하는 Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 출력할 배열의 Data 개수 만큼 행을 생성
        return titles.count
    }

    // Cell 을 만들어서 설정하는 Method
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel!.text = titles[indexPath.row]
        return cell
    }
    
    // Cell 을 선택하였을 때 호출되는 Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 선택한 Cell 의 Link 가져오기
        let addr = links[indexPath.row]
        
        // 하위 View Controller 생성
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        // Data 넘겨주기
        detailViewController.addr = addr
     
        // 출력
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// Tag 안의 내용을 일시적으로 저장할 문자열 변수 생성
var contents : String!

extension RootViewController : XMLParserDelegate{
    
    // 여는 Tag 를 만났을 때 호출되는 Method
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        // 속성이 있다면 속성을 읽어야 합니다.
        // 속성이 없기 때문에 별도로 할 일은 없습니다.
        
    }
    
    // 여는 Tag 와 닫는 Tag 안의 내용을 만났을 때 호출되는 Method
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        // Tag 안에 내용을 'contents' 에 저장하는 것 입니다.
        contents = string
    }
    
    // 닫는 Tag 를 만났을 때 호출되는 Method
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if elementName == "title"{
            titles.append(contents)
        }else if elementName == "link"{
            links.append(contents)
        }
        contents = nil
    }
}
