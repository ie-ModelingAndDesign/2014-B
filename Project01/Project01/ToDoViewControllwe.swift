//
//  ViewController.swift
//  Project01
//
//  Created by Natsuki Sawasaki on 2015/02/22.
//  Copyright (c) 2015年 Natsuki Sawasaki. All rights reserved.
//

import UIKit
import CoreData

struct Item{
    var title: String
    var subtitle: String
    
    init (title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
}



class ToDoViewControllwe: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Todoモデルを格納する配列
    var items = [Task]()
    var itemsTest = [Item]()
  //  var itemsTest = ["OS1.2","モデリング","実験レポート","情報理論期末資料作成","VLSH期末レポート","OS2.4","OS2.7","OS4.1","OS4.3","OS4.4","OS11.1"]

    @IBOutlet var taskTable: UITableView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveName()
        println(itemsTest.count)
        // Do any additional setup after loading the view, typically from a nib.
        self.itemsTest.append(Item(title: "OS1.2", subtitle: "進捗:80"))
        self.itemsTest.append(Item(title: "モデリング", subtitle: "進捗:20"))
        self.itemsTest.append(Item(title: "実験レポート", subtitle: "進捗:70"))
        self.itemsTest.append(Item(title: "情報理論期末資料作成", subtitle: "進捗:0"))
        self.itemsTest.append(Item(title: "VLSI期末レポート", subtitle: "進捗:30"))
        self.itemsTest.append(Item(title: "OS2.4", subtitle: "進捗:0"))
        self.itemsTest.append(Item(title: "OS2.7", subtitle: "進捗:0"))
        self.itemsTest.append(Item(title: "OS4.1", subtitle: "進捗:0"))
        self.itemsTest.append(Item(title: "OS4.4", subtitle: "進捗:0"))
        self.itemsTest.append(Item(title: "OS11.1", subtitle: "進捗:0"))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        // AppDelegateクラスのインスタンスを取得
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        // AppDelegateクラスからNSManagedObjectContextを取得
        // ゲッターはプロジェクト作成時に自動生成されている
        if let managedObjectContext = appDelegate.managedObjectContext {
            // EntityDescriptionのインスタンスを生成
            let entityDiscription = NSEntityDescription.entityForName("Task", inManagedObjectContext: managedObjectContext);
            // NSFetchRequest SQLのSelect文のようなイメージ
            let fetchRequest = NSFetchRequest();
            fetchRequest.entity = entityDiscription;
            
            var error: NSError? = nil;
            // フェッチリクエストの実行
            if var results = managedObjectContext.executeFetchRequest(fetchRequest, error: &error) {
                items = []
                for managedObject in results {
                    let model = managedObject as Project01.Task
                    items.append(model)
                    println("cccc")
                }
            }
        }
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        // リストの件数を返す
        return  itemsTest.count
    }
    
    // セルをitemsから設定する処理
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        //let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as CustomViewCell
        //let button = UIButton(frame: CGRectMake(0, 0, 100, 100))

        //button.addTarget(self, action: "tmpButtonTouch:", forControlEvents: UIControlEvents.TouchUpInside)
        //button.setTitle("鳥", forState: .Normal)
        //cell.accessoryView = button
        
        cell.name?.text = itemsTest[indexPath.row].title
        cell.progress?.text = itemsTest[indexPath.row].subtitle
        cell.twiButton?.addTarget(self, action: "tmpButtonTouch:", forControlEvents: UIControlEvents.TouchUpInside)
        cell.twiButton?.setTitle("鳥", forState: .Normal)
        
        //cell.backgroundColor = UIColor.blueColor()
        return cell
    }
    
    func tmpButtonTouch(sender: UIButton!) {
        var button: UIButton = sender
        println("button.tag: \(button.tag)")
    }
    
    @IBAction func TaskBackButton(segue:UIStoryboardSegue){
        NSLog("FirstViewController#backFromSecondView")
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
            
            model.name = "tes"
            model.memo = "aaaaaaaaa"
            model.time = "time"
            model.progress = 22
        }
        //////////////////////////////////////////////////
        
        
        println("object saved")
    }

}

