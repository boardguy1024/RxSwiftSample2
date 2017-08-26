//
//  ViewModel.swift
//  RxSwift_Sample2
//
//  Created by park kyung suk on 2017/08/27.
//  Copyright © 2017年 park kyung suk. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    
    let dummyItems = [
        Item.init(imageUrl: "https://tpc.googlesyndication.com/simgad/14282352585702206891", title: "google"),
        Item.init(imageUrl: "https://tpc.googlesyndication.com/simgad/14282352585702206891", title: "naver"),
        Item.init(imageUrl: "https://tpc.googlesyndication.com/simgad/14282352585702206891", title: "yahoo"),
        ]

    //outPut
    var items = Variable<[Item]>.init([])
    
    func requestData() {
        
        self.items.value += dummyItems
    }

}
