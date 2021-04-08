//
//  ViewController.swift
//  02-CustomFont
//
//  Created by lym on 2021/4/1.
//

import UIKit

class ViewController: UIViewController {
    /*
     添加自定义字体:
        1. 将字体拖入项目中
        2. 配置plist文件 Fonts provided by application
        3. 寻找真正的字体名称，

     var i = 0
     for family: String in UIFont.familyNames {
         print("\(i)---项目字体---\(family)")
         for names: String in UIFont.fontNames(forFamilyName: family) {
             print("== \(names)")
         }
         i += 1
     }
     */

    @IBOutlet var changeBtn: UIButton!
    @IBOutlet var textLabel: UILabel!

    @IBOutlet weak var btn2: UIButton!
    
    var fontNames = ["MFTongXin_Noncommercial-Regular",
                     "MFJinHei_Noncommercial-Regular",
                     "MFZhiHei_Noncommercial-Regular",
                     "Zapfino",
                     "Gaspar Regular"]

    let text = """
    平滑过度圆角：iOS 13上只需要一句话.layer.cornerCurve = .continuous

     30 Days Swift, 这些字体特别适合打「奋斗」和「理想」,
     谢谢「造字工房」，本案例不涉及商业使用,使用到造字工房劲黑体，致黑体，童心体,

    """

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let image = UIImage(systemName: "fiberchannel")?.withTintColor(.white).withRenderingMode(.alwaysOriginal)
        changeBtn.setImage(image, for: .normal)
        changeBtn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        changeBtn.layer.cornerRadius = 20
        
        //
        changeBtn.layer.cornerCurve = .continuous
        
        // - 2
        btn2.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        btn2.layer.cornerRadius = 20

        // --
        textLabel.text = text

        var i = 0
        for family: String in UIFont.familyNames {
            print("\(i)---项目字体---\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family) {
                print("== \(names)")
            }
            i += 1
        }
    }

    @IBAction func chage(_ sender: Any) {
        let fontRowIndex = Int.random(in: 0 ..< 4)
        print(fontRowIndex)
        textLabel.font = UIFont(name: fontNames[fontRowIndex], size: 20)
    }
}
