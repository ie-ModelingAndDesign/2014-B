//
//  Task.swift
//  Project01
//
//  Created by Natsuki Sawasaki on 2015/02/22.
//  Copyright (c) 2015年 Natsuki Sawasaki. All rights reserved.
//

import Foundation
import CoreData

class Task: NSManagedObject {

    @NSManaged var time: String
    @NSManaged var name: String
    @NSManaged var memo: String
    @NSManaged var progress: NSNumber

}
