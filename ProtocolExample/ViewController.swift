//
//  ViewController.swift
//  ProtocolExample
//
//  Created by 長内幸太郎 on 2019/12/18.
//  Copyright © 2019 長内幸太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate: AAAProtocol!
    }
    
    @IBAction func tap(_ sender: Any) {
    }
    
}

extension ViewController: HaveHogeFlagProtocol {
}





protocol AAAProtocol: UIViewController {
    func buttonDidTap(next: UIViewController)
}

extension AAAProtocol {
    func buttonDidTap(next: UIViewController) {
        self.show(next, sender: nil)
    }
}

protocol BBBProtocol: AAAProtocol {
    // これはできる
}
extension BBBProtocol {
    func buttonDidTap(next: UIViewController) {
    }
}

protocol CCCProtocol: AnyObject {
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

// 警告
//protocol GGGProtocol: UIViewController, BBBProtocol {
//    // Redundant superclass constraint 'Self' : 'UIViewController'
//}

protocol HHHProtocol: UIViewController, CCCProtocol {
    // これはOK、上記はBBBProtocolがUIVIewControllerにclass-onlyしてたから
}

// エラー extensionではprotocolはprotocolを適用できない
//protocol GGGProtocol: UIViewController {
//}
//extension GGGProtocol: BBBProtocol {
//    // Extension of protocol 'GGGProtocol' cannot have an inheritance clause
//}








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



//////////////

protocol AProtocol: UIViewController {
    func aaa()
}
protocol BProtocol: AnyObject {
    func bbb()
}
protocol CProtocol: AProtocol, BProtocol {
}
extension CProtocol {
    func bbb() {
        self.show(UIViewController(), sender: nil)
    }
}



///////////

protocol UIViewProtocol: UIView {
}
// Inheritance from non-protocol, non-class type 'String'
// Type 'Self' constrained to non-protocol, non-class type 'String'
//protocol StringProtocol: String {
//}

protocol NSObjectProtocol: NSObject {
    // 可能
}

protocol UIViewControllerProtocol1: UIViewController {
    // 可能
}
protocol UIViewControllerProtocol2: UIViewController {
    // 可能
}

//protocol IntProtocol: Int {
//}

//protocol ArrayProtocol: Array {
//    // 不可
//}

//protocol ZZZProtocol: UIViewProtocol, UIViewControllerProtocol {
//
//}

protocol YYYProtocol: UIViewControllerProtocol1, UIViewControllerProtocol2 {
}

protocol XXXProtocol: UIViewController, UIViewControllerProtocol1 {
    
}

protocol UIViewControllerProtocol3: UIViewControllerProtocol2 {
}
protocol UIViewControllerProtocol4: UIViewControllerProtocol1, UIViewControllerProtocol3 {
}

//class HogeHoge: String {}
