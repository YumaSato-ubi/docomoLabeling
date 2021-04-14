//
//  LabelingViewController.swift
//  ActivityLabeling
//
//  Created by Wataru Sasaki on 2018/02/15.
//  Copyright © 2018年 Wataru Sasaki. All rights reserved.
//

import UIKit
import APIKit
import Cosmos

private let reuseIdentifier = "Cell"

@available(iOS 13.0, *)
class LabelingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let api = APIManager.shared
    let activities = UserDefaults.standard.array(forKey: Config.activities)!
    var selectedItems = [Int: Bool]()
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var purpleView: UIView!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet var collectionView: UICollectionView! = nil
    
    /// 行動が選択されているかどうかを判定する
    ///
    /// - Returns: 行動が一つでも選択されているかどうか
    func selected() -> Bool {
        if self.selectedItems.isEmpty {
            return false
        }
        return true
    }
    
    /// 行動が選択されているかどうかを確認して、ステータスを変更する
    func changeStatus() {
        if self.selected() {
            // 行動が選択されていればステータスをノーマルに変える
            self.navigationController?.navigationBar.barTintColor = .flatBlack()
            self.title = ""
        } else {
            // 行動が選択されていなければステータスを未選択に変える
            self.navigationController?.navigationBar.barTintColor = .flatRed()
            self.title = "Unselected"
        }
    }
    
    /// 終了ボタンを押した時の処理
    @IBAction func exit(_ sender: Any) {
        
        guard !self.selected() else {
            // 行動を選択している状態で終了しようとした場合
            let alert = UIAlertController(title: "エラー",
                                          message: "全ての行動を終了してください．",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        // 誤って終了してしまうのを防ぐためにアラートを表示
        let alert = UIAlertController(title: "Finish Labeling",
                                      message: "ラベリングを終了しますか？",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Finish",
                                      style: .default,
                                      handler: { action in
                                        self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        navigationController?.presentationController?.delegate = self
        
        // docomo追加部分
        let width:CGFloat = 704.0
        let height:CGFloat = 939.5
        
        let outLayer = CALayer()
        let healLayer = CALayer()
        let hygiLayer = CALayer()
        let homeLayer = CALayer()
        let enterLayer = CALayer()
        
        
        let outLabel = UILabel()
        outLabel.frame = CGRect(x: width*3/16, y: 0, width: width/2, height: height/9)
        outLabel.text = "健康"
        outLabel.font = UIFont(name: "Hiragino Maru Gothic ProN", size: 50)
        self.view.addSubview(outLabel)
        outLayer.frame = CGRect(x: 0, y: 0, width: width/2, height: height/3)
        outLayer.backgroundColor = UIColor(red: 120/256.0, green: 150/256.0, blue: 256/256.0, alpha: 0.1).cgColor
        view.layer.addSublayer(outLayer)
        
        let healLabel = UILabel()
        healLabel.frame = CGRect(x: width*11/16, y: 0, width: width/2, height: height/9)
        healLabel.text = "衛生"
        healLabel.font = UIFont(name: "Hiragino Maru Gothic ProN", size: 50)
        self.view.addSubview(healLabel)
        healLayer.frame = CGRect(x: width/2, y: 0, width: width/2, height: height/3)
        healLayer.backgroundColor = UIColor(red: 0, green: 0, blue: 256/256.0, alpha: 0.1).cgColor
        view.layer.addSublayer(healLayer)

        let hygiLabel = UILabel()
        hygiLabel.frame = CGRect(x: width*3/16, y: height*3/9, width: width/2, height: height/9)
        hygiLabel.text = "家事"
        hygiLabel.font = UIFont(name: "Hiragino Maru Gothic ProN", size: 50)
        self.view.addSubview(hygiLabel)
        hygiLayer.frame = CGRect(x: 0, y: height/3, width: width/2, height: height/3)
        hygiLayer.backgroundColor = UIColor(red: 256/256.0, green: 0, blue: 0, alpha: 0.1).cgColor
        view.layer.addSublayer(hygiLayer)

        let homeLabel = UILabel()
        homeLabel.frame = CGRect(x: width*11/16, y: height*3/9, width: width/2, height: height/9)
        homeLabel.text = "娯楽"
        homeLabel.font = UIFont(name: "Hiragino Maru Gothic ProN", size: 50)
        self.view.addSubview(homeLabel)
        homeLayer.frame = CGRect(x: width/2, y: height/3, width: width/2, height: height/3)
        homeLayer.backgroundColor = UIColor(red: 0/256.0, green: 256/256.0, blue: 0, alpha: 0.1).cgColor
        view.layer.addSublayer(homeLayer)

        let enterLabel = UILabel()
        enterLabel.frame = CGRect(x: width*3/16, y: height*6/9, width: width/2, height: height/9)
        enterLabel.text = "外出"
        enterLabel.font = UIFont(name: "Hiragino Maru Gothic ProN", size: 50)
        self.view.addSubview(enterLabel)
        enterLayer.frame = CGRect(x: 0, y: height/3*2, width: width/2, height: height/3)
        enterLayer.backgroundColor = UIColor(red: 0/256.0, green: 256/256.0, blue: 256/256.0, alpha: 0.1).cgColor
        view.layer.addSublayer(enterLayer)
        
        collectionView.collectionViewLayout = createLayout()
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView!.register(UINib(nibName: "LabelingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.allowsMultipleSelection = true

        //
        super.viewDidLoad()

        self.changeStatus()
    }
    override func viewDidAppear(_ animated: Bool) {
        print(view.frame.width)
        print(view.frame.height)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // 画面の向きが変わったらアイコンの大きさを更新する
        self.collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = self.view.frame.width
        let height: CGFloat = self.view.frame.height
        var cellSize: CGFloat = 0
        if width < height {
            cellSize = width / 5
        } else {
            cellSize = height / 5
        }
        return CGSize(width: cellSize, height: cellSize)
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LabelingCollectionViewCell
    
        // Configure the cell(各行動セルの決定)
        let activity = self.activities[indexPath.row] as! String
        cell.imageView.image = UIImage(named: activity)?.withRenderingMode(.alwaysTemplate)
        cell.textLabel.text = activity
        
        if selectedItems[indexPath.row] != nil {
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
            cell.isSelected = true
            cell.iconView.backgroundColor = .flatSkyBlue()
        } else {
            collectionView.deselectItem(at: indexPath, animated: false)
            cell.isSelected = false
            cell.iconView.backgroundColor = .flatBlack()
        }
    
        return cell
    }
    
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! LabelingCollectionViewCell
        let activity = activities[indexPath.row] as! String
        let status = cell.isSelected
        let time = Date()
        var starLevel: Double = 3
        
        let message = "今日1日の満足度はどれくらいでしたか？\n\n\n"
        let alert2 = UIAlertController(title: "アンケート", message: message, preferredStyle: .alert)
        let ratingView = CosmosView(frame: CGRect(x: 55, y: 80, width: 100, height: 60))
        
        let massage = "\(activity)を開始しますか？"
        let alert = UIAlertController(title: "Start Activity", message: massage, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.api.writeStar(time: time, status: starLevel, handler: { error in
                guard (error == nil) else {
                    print("Not sent.")
                    return
                }
                print("starLevel:" + String(starLevel))
            })
        })
        alert.addAction(UIAlertAction(title: "Start", style: .default, handler: { action in
            self.api.write(time: time, activity: activity, status: status, handler: { error in
                
                ratingView.rating = 0
                ratingView.settings.starSize = 30
                ratingView.settings.emptyBorderColor = UIColor.black
                ratingView.settings.updateOnTouch = true
                
                if activity == "睡眠" {
                    alert2.addAction(ok)
                    alert2.view.addSubview(ratingView)
                    self.present(alert2, animated: true, completion: nil)
                    ratingView.didTouchCosmos = { rating in
                        print(rating)
                        starLevel = rating
                    }
                }

                guard (error == nil) else {
                    // 通信失敗したら選択状態を元に戻す
                    collectionView.deselectItem(at: indexPath, animated: true)
                    
                    let alert = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    return
                }
                
                self.selectedItems[indexPath.row] = true
                cell.iconView.backgroundColor = .flatSkyBlue()
                
                self.changeStatus()
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            // キャンセル時には選択状態を元に戻す
            collectionView.deselectItem(at: indexPath, animated: true)
        }))
        self.present(alert, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! LabelingCollectionViewCell
        let activity = self.activities[indexPath.row] as! String
        let status = cell.isSelected
        let time = Date()
        
        let massage = "\(activity)を終了しますか？"
        let alert = UIAlertController(title: "Finish Activity", message: massage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Finish", style: .default, handler: { action in
            self.api.write(time: time, activity: activity, status: status, handler: { error in
                
                guard (error == nil) else {
                    // 通信失敗したら選択状態を元に戻す
                    collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
                    
                    let alert = UIAlertController(title: "Error", message: error.debugDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    return
                }
                
                self.selectedItems.removeValue(forKey: indexPath.row)
                cell.iconView.backgroundColor = .flatBlack()
                
                self.changeStatus()
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            // キャンセル時には選択状態を元に戻す
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        }))
        self.present(alert, animated: true)
    }
    
    func createLayout() -> UICollectionViewLayout {
        let width:CGFloat = 704.0
        let height:CGFloat = 939.5
        
        let sectionUp:CGFloat = height/9
        let sectionBottom:CGFloat = 10
        let smallSquareWidth:CGFloat = height/9 - sectionBottom
//        let mediumSquareWidth:CGFloat = height/9 - sectionBottom
        let sectionInset:CGFloat = (width - smallSquareWidth*4) / 8
//        let sectionInset2:CGFloat = (width - smallSquareWidth*3) / 6`

        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let nestedGroupA: NSCollectionLayoutGroup = {
                
                let topSmallSquareItem = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(smallSquareWidth), heightDimension: .absolute(sectionUp + smallSquareWidth + sectionBottom)))
                topSmallSquareItem.contentInsets = NSDirectionalEdgeInsets(top: sectionUp, leading: sectionInset, bottom: sectionBottom, trailing: sectionInset)
                let topSmallSquareGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(width/2), heightDimension: .absolute(height*2/9)), subitem: topSmallSquareItem, count: 2)
                
                let smallSquareItem = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(smallSquareWidth), heightDimension: .absolute(smallSquareWidth)))
                smallSquareItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: sectionInset, bottom: 0, trailing: sectionInset)
                
                let smallSquareGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(width/2), heightDimension: .absolute(height/9)), subitem: smallSquareItem, count: 2)
                
                let mediumGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(width/2), heightDimension: .absolute(height/3)), subitems: [topSmallSquareGroup,smallSquareGroup])
                
                let nestedGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(height/3)), subitem: mediumGroup, count: 2)
                return nestedGroup
            }()
            
            let nestedGroupB: NSCollectionLayoutGroup = {
                let smallSquareItem = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(smallSquareWidth), heightDimension: .absolute(height/3)))
                    smallSquareItem.contentInsets = NSDirectionalEdgeInsets(top: sectionUp, leading: sectionInset, bottom: sectionUp, trailing: sectionInset)
                let mediumSquareItem = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(width/2), heightDimension: .absolute(height/3)))
                    mediumSquareItem.contentInsets = NSDirectionalEdgeInsets(top: sectionUp, leading: sectionInset, bottom: sectionUp - sectionBottom*2, trailing: sectionInset)
                
                let smallSquareGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(width/2), heightDimension: .absolute(height/3)), subitem: smallSquareItem, count: 2)

//                let mediumSquareGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(width/2), heightDimension: .absolute(height/3)), subitem: mediumSquareItem, count: 1)
//
                let SquareGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(height/3)), subitems: [smallSquareGroup, mediumSquareItem])
                return SquareGroup
            }()
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(height)), subitems: [nestedGroupA, nestedGroupA, nestedGroupB])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            return section
        }
        return layout
    }

}

@available(iOS 13.0, *)
extension LabelingViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        false
    }
}
