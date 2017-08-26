//
//  ViewController.swift
//  RxSwift_Sample2
//
//  Created by park kyung suk on 2017/08/27.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let bag = DisposeBag()
    
    var tableItems = [Item]()
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        self.button.rx.controlEvent(UIControlEvents.touchUpInside).asObservable()
            .subscribe { (event) in
               self.viewModel.requestData()
        }.addDisposableTo(bag)
        
        bindToViewModel()
    }
    
    func bindToViewModel() {
       viewModel.items.asObservable().subscribe(onNext: { (items) in
        self.tableItems = items
        self.tableView.reloadData()
        
       }).addDisposableTo(bag)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        let item = tableItems[indexPath.row]
        
        do {
            let data = try Data(contentsOf: URL(string: item.imageUrl)!)
            cell.imageView?.image = UIImage(data: data)
        } catch { }
        cell.textLabel?.text = item.title
        
        return cell
    }
}











