//
//  Duck.swift
//  SimUDuck
//
//  Created by 추만석 on 2022/11/16.
// MARK: 전략 패턴
// -> 알고리즘군을 정의하고 캡슐화해서 각각의 알고리즘군을 수정해서 쓸 수 있게 해 줍니다. 전략 패턴을 사용하면 클라이언트로부터 알고리즘을 분리해서 독립적으로 변경할 수 있습니다.
import Foundation

// MARK: getter, setter 비교
// #1 MARK: *** 이게 더 가독성이 좋아보임.
class MallardDuck: Duck {
    internal var flyBehavior: FlyBehavior
    internal var quackBehavior: QuackBehavior
    
    init() {
        self.flyBehavior = FlyNoWay()
        self.quackBehavior = Quack()
    }
    
    func flyBehavior(_ flyBehavior: FlyBehavior) {
        self.flyBehavior = flyBehavior
    }
    
    func quackBehavior(_ quackBehavior: QuackBehavior) {
        self.quackBehavior = quackBehavior
    }
    
    func display() {
        print("저는 물오리예요잉~!")
    }
}
// #2
class ModelDuck: Duck {
    var _flyBehavior: FlyBehavior = FlyNoWay()
    var _quackBehavior: QuackBehavior = Quack()
    
    var flyBehavior: FlyBehavior {
        get {
            return _flyBehavior
        }
        set (newFly){
            _flyBehavior = newFly
        }
    }
    var quackBehavior: QuackBehavior {
        get {
            return _quackBehavior
        }
        set (newQuack){
            _quackBehavior = newQuack
        }
    }
    
    func display() {
        print("저는 모형 오리입니다.")
    }
}

class FlyRocketPowered: FlyBehavior {
    func fly() {
        print("화성 갈끄니까~!~!~!~!~")
    }
}

protocol Duck {
    // MARK: A(Duck)에는 B(flyBehavior, quackBehavior)가 있다.
    // -> 이렇게 두 클래스를 합치는 것을 구성(Composition)을 이용한다라고 부른다.
    // MARK: 디자인 원칙: 상속보다는 구성을 활용한다.
    // -> 구성을 활용해서 만든 시스템은 유연성을 크게 향상시킨다.
    var flyBehavior: FlyBehavior { get set }
    var quackBehavior: QuackBehavior { get set }
}

extension Duck {
    func performFly() {
        flyBehavior.fly()
    }
    
    func performQuack() {
        quackBehavior.quack()
    }
    
    func swim() {
        print("모든 오리는 물에 뜹니다. 가짜 오리도 뜨죠잉~!")
    }
}

protocol FlyBehavior {
    func fly()
}

class FlyWithWings: FlyBehavior {
    func fly() {
        print("날고 있어요!! ")
    }
}

class FlyNoWay: FlyBehavior {
    func fly() {
        print("저는 못 날아요 ㅠㅠ")
    }
    
}

protocol QuackBehavior {
    func quack()
}

class Quack: QuackBehavior {
    func quack() {
        print("꽦!!꽦!!")
    }
}

class MuteQuack: QuackBehavior {
    func quack() {
        print("~~~~~조용~~~~~")
    }
}

class Squeak: QuackBehavior {
    func quack() {
        print("삑!")
    }
}
