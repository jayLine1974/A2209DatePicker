//
//  ViewController.swift
//  A2209DatePicker
//
//  Created by 林俊傑 on 2022/2/6.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var disPlayDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //讀取 記憶的資料
        let userDeft = UserDefaults.standard
        let date = userDeft.object(forKey: "lastInput")
        if let theDate = date as? Date{
//            print(theDate.timeIntervalSince1970)
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy/MMMM/dd HH:mm"
            dateFormater.locale = Locale(identifier: "zh_Hant_TW")
            let dateStr = dateFormater.string(from: theDate)
            disPlayDate.text = dateStr
            
        }else{
            //print("no date")
            disPlayDate.text = ""
        }
    }

    @IBAction func selectDateAction(_ sender: UIDatePicker) {
        
//        disPlayDate.text = "\(sender.date)"
        let theDate = sender.date
        let dateFormater = DateFormatter()
        //同步 寫入手機記憶體
        let userDeft = UserDefaults.standard
        userDeft.set(theDate, forKey: "lastInput")
        userDeft.synchronize()// 寫入
        //
        dateFormater.dateFormat = "yyyy/MMMM/dd HH:mm"
        dateFormater.locale = Locale(identifier: "zh_Hant_TW")
        let dateStr = dateFormater.string(from: theDate)
        disPlayDate.text = dateStr
         
        
        
    }
    
}

