//
//  ViewController.swift
//  Project01
//
//  Created by Natsuki Sawasaki on 2015/02/22.
//  Copyright (c) 2015年 Natsuki Sawasaki. All rights reserved.
//

import UIKit
import CoreData

enum BtnTag: Int {
    case Mon1 = 01, Mon2, Mon3, Mon4, Mon5,
         Tue1 = 11, Tue2, Tue3, Tue4, Tue5,
         Wed1 = 21, Wed2, Wed3, Wed4, Wed5,
         Thu1 = 31, Thu2, Thu3, Thu4, Thu5,
         Fri1 = 41, Fri2, Fri3, Fri4, Fri5
    
    static let allValues: [BtnTag] =
       [Mon1, Mon2, Mon3, Mon4, Mon5,
        Tue1, Tue2, Tue3, Tue4, Tue5,
        Wed1, Wed2, Wed3, Wed4, Wed5,
        Thu1, Thu2, Thu3, Thu4, Thu5,
        Fri1, Fri2, Fri3, Fri4, Fri5]
    
    func week() -> Int{
        return ((self.rawValue-1)/10)
    }
    
    func dayW() -> String{
        let we :Int  = (self.rawValue-1)/10
        switch (we){
            case 0: return ("Mon")
            case 1: return ("Tue")
            case 2: return ("Wed")
            case 3: return ("Thu")
            case 4: return ("Fri")
            default: break
        }
        return ("Other")
    }
    func toStr() -> String {
            return String(self.rawValue - 1)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemw = ["Mon","Tue","Wed","Thu","Fri"]
        // Do any additional setup after loading the view, typically from a nib.
        for (index,btag) in enumerate(itemw) {
            var x = CGFloat(70+60 * index)
            var y = CGFloat(100)
            var btn = UIButton(frame: CGRectMake(x, y, 50, 50))
            btn.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.7)
            btn.setTitle("\(btag)", forState: .Normal)
            self.view.addSubview(btn)
        }
        
        let itemi = ["1","2","3","4","5"]
        // Do any additional setup after loading the view, typically from a nib.
        for (index,btag) in enumerate(itemi) {
            var x = CGFloat(10)
            var y = CGFloat(160+60 * index)
            var btn = UIButton(frame: CGRectMake(x, y, 50, 50))
            btn.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.7)
            btn.setTitle("\(btag)", forState: .Normal)
            self.view.addSubview(btn)
        }

        
        for btag in BtnTag.allValues {
            var x = CGFloat(70+60 * btag.week())
            var y = CGFloat(100+60 * (btag.rawValue - btag.week()*10) - 1)
            var btn = UIButton(frame: CGRectMake(x, y, 50, 50))
            btn.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.8)
            btn.tag = btag.rawValue
            btn.setTitle("\(btag.rawValue - 1)", forState: .Normal)
            btn.addTarget(self, action: "pushed:", forControlEvents: .TouchUpInside)
            self.view.addSubview(btn)
        }
    }
    
    func pushed(sender: UIButton){
        var btag = BtnTag(rawValue: sender.tag)!
        
            println("Pushed Number is " + btag.toStr())
    }
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func TimeSchedulerButton(segue:UIStoryboardSegue){
        NSLog("FirstViewController#backFromSecondView")
    }
    
    
    func saveName(name: String){
        
        
        //////////////////////////////////////////////
        // Do any additional setup after loading the view, typically from a nib.
        // AppDelegateクラスのインスタンスを取得
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        // AppDelegateクラスからNSManagedObjectContextを取得
        // ゲッターはプロジェクト作成時に自動生成されている
        if let managedObjectContext = appDelegate.managedObjectContext {
            // NSEntityDescriptionから新しいエンティティモデルのインスタンスを取得
            // 第一引数はモデルクラスの名前、第二引数はNSManagedObjectContext
            let managedObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Timetable", inManagedObjectContext: managedObjectContext)
            // エンティティモデルにデータをセット
            let model = managedObject as Project01.Timetable
            
            model.subject = name
            model.room = name + "号"
        }
        //////////////////////////////////////////////////
        
        
        println("object saved")
    }
    
}

