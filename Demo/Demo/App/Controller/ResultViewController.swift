//
//  ResultViewController.swift
//  Demo
//
//  Created by Yuto Mizutani on 2018/09/04.
//  Copyright © 2018 Yuto Mizutani. All rights reserved.
//

import CiNiiKit
import UIKit

class ResultViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    var model: ResultModel


    var statusBarHeight: CGFloat!
    var navigationBarHeight: CGFloat!

    //SearchBarインスタンス
    private var mySearchBar: UISearchBar!

    //コレクションビュー
    var myCollectionView: UICollectionView!

    //コレクションビューに表示するベースとなる配列
    //ファイル名と製品名
    var array: Array<Array<String>> = [["battery", "充電式乾電池"], ["earphone", "イヤフォン"], ["hdmi", "HDMIケーブル"], ["huto", "封筒"], ["keyborad", "キーボード"], ["moouse", "マウス"], ["tissue", "テッシュ"], ["toiletpaper", "トイレペーパー"]]

    //検索された配列
    var searchedArray: Array<Array<String>>!

    convenience init(_ model: ResultModel) {
        self.model = model
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        searchedArray = array

        //サイズを取得
        statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        navigationBarHeight = (self.navigationController?.navigationBar.frame.size.height)!
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        let collectionFrame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        let searchBarHeight: CGFloat = 44

        // MARK: - CollectionView関連
        // CollectionViewのレイアウトを生成.
        let layout = UICollectionViewFlowLayout()

        // Cell一つ一つの大きさ.
        layout.itemSize = CGSize(width: viewWidth / 2, height: viewWidth / 1.5)

        // セルのマージン.
        layout.sectionInset = UIEdgeInsets.zero
        //layout.sectionInset = UIEdgeInsetsMake(16, 16, 16, 16)
        //セルの横方向のマージン
        layout.minimumInteritemSpacing = 0.0

        //セルの縦方向のマージン
        layout.minimumLineSpacing = 0.0

        // セクション毎のヘッダーサイズ.
        //サーチバー大きさ
        layout.headerReferenceSize = CGSize(width: viewWidth, height: searchBarHeight)

        // CollectionViewを生成.
        myCollectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: layout)

        // Cellに使われるクラスを登録.
        myCollectionView.register(ResultCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(ResultCollectionViewCell.self))

        //デリゲートとデータソースを設定
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.backgroundColor = .white

        //サーチバーの高さだけ初期位置を下げる
        myCollectionView.contentOffset = CGPoint(x: 0, y: searchBarHeight)
        self.view.addSubview(myCollectionView)

        // MARK: - SearchBar関連
        //SearchBarの作成
        mySearchBar = UISearchBar()
        //デリゲートを設定
        mySearchBar.delegate = self
        //大きさの指定
        mySearchBar.frame = CGRect(x: 0, y: 0, width: viewWidth, height: 44)
        //キャンセルボタンの追加
        mySearchBar.showsCancelButton = true
        self.myCollectionView.addSubview(mySearchBar)

        //虫眼鏡の設定を実装
        let rightNavBtn = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(rightBarBtnClicked(sender:)))
        self.navigationItem.rightBarButtonItem = rightNavBtn
    }

    //MARK: - 渡された文字列を含む要素を検索し、テーブルビューを再表示する
    func searchItems(searchText: String) {

        //要素を検索する
        if searchText != "" {
            searchedArray = array.filter { myItem in
                return (myItem[1]).contains(searchText)
                } as Array<Array<String>>

        } else {
            //渡された文字列が空の場合は全てを表示
            searchedArray = array
        }
        //再読み込みする
        myCollectionView.reloadData()
    }

    //MARK: - ナビゲーションバーの右の虫眼鏡が押されたら呼ばれる
    @objc internal func rightBarBtnClicked(sender: UIButton) {
        print("rightBarBtnClicked")
        myCollectionView.contentOffset = CGPoint(x: 0, y: -(statusBarHeight + navigationBarHeight))
    }

    //MARK: - CollectionView Delegate Methods
    //Cellが選択された際に呼び出される
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
    }

    //Cellの総数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedArray.count
    }

    //Cellに値を設定する
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell: ResultCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ResultCollectionViewCell.self), for: indexPath) as! ResultCollectionViewCell

        if let model = self.model
        cell.thumbnailImageView?.image = UIImage(named: searchedArray[indexPath.row][0])
        cell.textLabel?.text = searchedArray[indexPath.row][1]
        return cell
    }

    // MARK: - SearchBarのデリゲードメソッドたち
    //MARK: テキストが変更される毎に呼ばれる
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //検索する
        searchItems(searchText: searchText)
    }

    //MARK: キャンセルボタンが押されると呼ばれる
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

        mySearchBar.text = ""
        self.view.endEditing(true)
        searchedArray = array

        //コレクションビューを再読み込みする
        myCollectionView.reloadData()
    }

    //MARK: Searchボタンが押されると呼ばれる
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        self.view.endEditing(true)
        //検索する
        searchItems(searchText: mySearchBar.text! as String)
    }

}
