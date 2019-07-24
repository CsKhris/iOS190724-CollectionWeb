//
//  ViewController.swift
//  Collection_Web190724
//
//  Created by Ci on 24/07/2019.
//  Copyright © 2019 Ci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Image File 이름을 저장할 배열 생성
    var images : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Image File 이름들을 배열에 추가
        // car00.jpg ~ car24.jpg
        for i in 0...24{
            let imageName : String = String(format:"car%02i.jpg", i)
            images.append(imageName)
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // Cell 의 개수를 설정하는 Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    // Cell 의 모양을 설정하는 Method
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        // Image 설정
        NSLog("car/\(images[indexPath.row])")
        cell.imageView.image = UIImage(named: "car/\(images[indexPath.row])")
        
        return cell
    }
    
    // Cell 의 Size 를 만들어주는 Method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // CollectionView 의 전체 너비의 1/3
        let width = collectionView.frame.width / 3 - 1
        
        // 크기를 만들어서 Return : 너비와 높이가 같으므로 정사각형
        return CGSize(width: width, height: width)
    }
    
    // Cell 사이에 상하 간격을 설정하는 Method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // Cell 안에서 Item 과 외부 경계와의 간격을 설정하는 Method
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // Cell 이 선택되고 난 후 호출되는 Method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Cell 의 Index 에 해당하는 Cell 찾아오기
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.black.cgColor
        cell?.layer.borderWidth = 3.0
    }
    
    // Cell 을 누르고 있을 때 호출되는 Method
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        // Cell 의 Index 에 해당하는 Cell 찾아오기
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.blue.cgColor
        cell?.layer.borderWidth = 3.0
    }
    
    // Cell 의 선택을 해제할 때 호출되는 Method
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        
        // Cell 의 Index 에 해당하는 Cell 찾아오기
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = nil
        cell?.layer.borderWidth = 3.0
    }
}
