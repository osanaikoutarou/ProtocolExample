//
//  ViewController.swift
//  ProtocolExample
//
//  Created by 長内幸太郎 on 2019/12/18.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: HaveHogeFlagProtocol {
}





protocol AAAProtocol: UIViewController {
}

protocol BBBProtocol: AAAProtocol {
    // これはできる
}

protocol HaveHogeFlagProtocol: AnyObject {
    func hogeFlag() -> Bool
}
extension HaveHogeFlagProtocol {
    func hogeFlag() -> Bool {
        return true
    }
}

protocol DDDProtocol: AAAProtocol, HaveHogeFlagProtocol {
    // これもできちゃう
}








protocol HaveAAA: AnyObject {
    var aaa: Int { get }
}
extension HaveAAA {
    var aaa: Int {
        return 10
    }
}

protocol HaveBBB: AnyObject {
    var bbb: Int { get }
}
extension HaveBBB {
    var bbb: Int {
        return 10
    }
}

protocol HaveCCC: AnyObject {
    var ccc: Int { get }
}
extension HaveCCC {
    var ccc: Int {
        return 10
    }
}


protocol WorkZZZ: HaveAAA, HaveBBB, HaveCCC {
    func sumAll() -> Int
}
extension WorkZZZ {
    func sumAll() -> Int {
        let result = aaa + bbb + ccc
        return result
    }
}

