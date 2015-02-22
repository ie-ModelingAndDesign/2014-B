//
//  ViewController.swift
//  Project01
//
//  Created by Natsuki Sawasaki on 2015/02/22.
//  Copyright (c) 2015年 Natsuki Sawasaki. All rights reserved.
//

import UIKit
import CoreData

class AddTasklist: UIViewController,UITextFieldDelegate  {
    
    @IBOutlet var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    @IBAction func addCoreData(sender: AnyObject) {
        //saveName()
        //println("object saved")
    }
    @IBAction func AddTask(sender: AnyObject) {
        saveName()
    }
    
    func saveName(){
        
        
        //////////////////////////////////////////////
        // Do any additional setup after loading the view, typically from a nib.
        // AppDelegateクラスのインスタンスを取得
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        // AppDelegateクラスからNSManagedObjectContextを取得
        // ゲッターはプロジェクト作成時に自動生成されている
        if let managedObjectContext = appDelegate.managedObjectContext {
            // NSEntityDescriptionから新しいエンティティモデルのインスタンスを取得
            // 第一引数はモデルクラスの名前、第二引数はNSManagedObjectContext
            let managedObject: AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Task", inManagedObjectContext: managedObjectContext)
            // エンティティモデルにデータをセット
            let model = managedObject as Project01.Task
            
            model.name = nameText.text
        }
        //////////////////////////////////////////////////
        
        
        println("object saved")
    }

}

