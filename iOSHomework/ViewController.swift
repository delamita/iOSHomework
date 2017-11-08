//
//  ViewController.swift
//  iOSHomework
//
//  Created by 费克翔 on 2017/11/8.
//  Copyright © 2017年 LCC. All rights reserved.
//

import UIKit

extension UIColor{
    
    convenience init(byNumDisplayP3Red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat){
        
        self.init(red: byNumDisplayP3Red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
    static var buttnColor:UIColor{
        return UIColor.init(byNumDisplayP3Red: 66, green: 148, blue: 247, alpha: 1)
    }
    
}

class ViewController: UIViewController {
    
    

    @IBOutlet weak var lab1: UILabel!
    @IBOutlet weak var color: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
        
        lab1.shadowColor = UIColor.green
        
        lab1.shadowOffset = CGSize(width: 10, height: 10)
        lab1.layer.shadowRadius = 5
        lab1.layer.shadowOpacity = 0.5
    
        
        lab1.textColor = .red
        
        lab1.sizeToFit()
        
        lab1.textAlignment = .center
        
        lab1.text = "我是一个自定义的便签控件"
        lab1.sizeToFit()
        
        color.sizeToFit()
        color.text = "changeColorP3ByRed:,Blue:,Green:"

    }
    
    @IBAction func endEditing(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func textChange(_ sender: Any) {
        changeColor()
    }
    
    func changeColor() {
        
        var red:Int?
        var blue:Int?
        var green:Int?
        
        if color.text==nil{
            print("输入为空请重新输入")
            
            let alarm = UIAlertController(title: "输入有误", message: "输入为空请重新输入", preferredStyle: .alert)
            let OK = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alarm.addAction(OK)
            super.present(alarm, animated: true, completion: nil)
            
            return
        }
        
        let text = color.text!
        
        if text.contains("changeColorP3ByRed"){
            let result = text.components(separatedBy: ",")
            print(result)
            if result.count != 3 {
                
                let alarm = UIAlertController(title: "输入有误", message: "请按格式输入", preferredStyle: .alert)
                let OK = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                alarm.addAction(OK)
                super.present(alarm, animated: true, completion: nil)
                
                return
            }
            else{
                let t1 = result[0].components(separatedBy: ":")
                print(t1)
                if t1.count == 2{
                    let reds = t1[1]
                    red = Int(reds)
                }
                let t2 = result[1].components(separatedBy: ":")
                if t2.count == 2{
                    let blues = t2[1]
                    blue = Int(blues)
                }
                let t3 = result[2].components(separatedBy: ":")
                if t3.count == 2{
                    let greens = t3[1]
                    green = Int(greens)
                }
                
                if red==nil||blue==nil||green==nil{
                    let alarm = UIAlertController(title: "输入有误", message: "请按格式输入", preferredStyle: .alert)
                    let OK = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                    alarm.addAction(OK)
                    super.present(alarm, animated: true, completion: nil)
                    
                    return
                }
                
                if (red!)>255 || (red!)<0 || (blue!)>255 || (blue!)<0 || (green!)>255 || (green!)<0{
                    let alarm = UIAlertController(title: "输入颜色超过范围", message: "请输入0-255的RGB值", preferredStyle: .alert)
                    let OK = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                    alarm.addAction(OK)
                    super.present(alarm, animated: true, completion: nil)
                }
                
                print(red,blue,green)
                
                self.view.backgroundColor = UIColor(byNumDisplayP3Red: CGFloat(red!), green: CGFloat(green!), blue: CGFloat(blue!), alpha: 1)

                
            }
            
        }
        else{
            
            var color:UIColor
            
            switch text{
            case "red":
                color = .red
            case "blue":
                color = .blue
            case "black":
                color = .black
            case "yellow":
                color = .yellow
            case "white":
                color = .white
            case "green":
                color = .green
            case "purple":
                color = .purple
            case "lightGray":
                color = .lightGray
            default: color = self.view.backgroundColor!
            }
            
            self.view.backgroundColor = color
        }
        
    }
    
    @IBOutlet weak var teView: UITextView!
    @IBOutlet weak var selector: UISegmentedControl!
    
    @IBAction func texChange(_ sender: Any) {
        if selector.selectedSegmentIndex == 0{
            teView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        }
        else {
            teView.text = "洛姆伊普多或坐的是埃利特拉梅特，他是圣女，他是圣女，他是圣女，他是圣女。我们的广告是一个很好的例子，它是一个很好的例子，它是一个很好的例子，它是一个很好的例子。这是一种可以被谴责的，它是由在纽兰的欧盟里的欧盟所引起的。除了不受影响的人外，没有人会说他是一个人，他的工作是在一个人的环境中工作。南丽人的意识到对文明的影响。"
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

