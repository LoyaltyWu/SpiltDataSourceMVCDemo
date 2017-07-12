//
//  ModuleData.swift
//  SpiltDataSource
//
//  Created by LoyaltyWu on 17/7/11.
//  Copyright © 2017年 LoyaltyWu. All rights reserved.
//

import Foundation

// Module should be completely UI free
class ModuleData:NSObject{
    public var x:Int
    public var y:Int
    override init(){
        x = 0
        y = 3*x+1 // small module processing
    }
    init(xx:Int){
        x = xx
        y = 3*x+1 // small module processing
    }
    init(xx:Int,yy:Int){
        x = xx
        y = yy
    }
}
