//
//  main.swift
//  SimUDuck
//
//  Created by 추만석 on 2022/11/16.
//

import Foundation

func miniDuckSimulator() {
    let mallard = MallardDuck()
    mallard.flyBehavior = FlyNoWay()
    mallard.performQuack()
    mallard.performFly()
    
    
    let model = ModelDuck()
    model.performFly()
    model.flyBehavior = FlyRocketPowered()
    model.performFly()
}

miniDuckSimulator()
