//
//  ViewController.swift
//  PasswordHacker
//
//  Created by 藤井玖光 on 2022/08/25.
//

import UIKit

class ViewController: UIViewController {

    //結果表示用ラベル
    @IBOutlet var resultLabel1: UILabel!
    @IBOutlet var resultLabel2: UILabel!
    @IBOutlet var resultLabel3: UILabel!
    @IBOutlet var resultLabel4: UILabel!
    
    //カウント表示ラベル
    @IBOutlet var countLabel: UILabel!
    
    //秘密のパスワード
    var passwoed:Int = 1234
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func start() {
        for i in 0...9999{
            //解析中の数字を表示する
            countLabel.text = String(i)
            
            //処理を0.0005秒待機する
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.0005))
            
            //passwordとiが一致したら...
            if  i == passwoed{
                //passwordの桁ごとにの数字を入れる配列
                var digits = [Int]()
                for _ in 0...3{
                    digits.append(passwoed % 10)
                    passwoed = passwoed / 10
                }
                
                resultLabel1.text = String(digits[0])
                resultLabel2.text = String(digits[1])
                resultLabel3.text = String(digits[2])
                resultLabel4.text = String(digits[3])
                
                print("正解は\(i)です！")
            }
        }
    }
    
    @IBAction func reset() {
        
        //passwordを1234に再設定する
        passwoed = 1234
        
        //countLabelの表示を元に戻す
        countLabel.text = "「START」ボタンを押して解析開始"
        
        //ラベルの表示を全て0に戻す
        resultLabel1.text = "0"
        resultLabel2.text = "0"
        resultLabel3.text = "0"
        resultLabel4.text = "0"
        
    }
}

