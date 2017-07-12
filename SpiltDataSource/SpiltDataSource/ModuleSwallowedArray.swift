//
//  ModuleDataSwallowArray.swift
//  SpiltDataSource
//
//  Created by LoyaltyWu on 17/7/12.
//  Copyright © 2017年 LoyaltyWu. All rights reserved.
//

import Foundation

class ModuleSwallowedArray:NSObject{
    dynamic var instance:[ModuleData] = [ModuleData]()
    override init() {
        instance = [ModuleData]()
    }
    // 别的初始化方式可以是从CoreData中拿出历史数据进行初始化。
}
