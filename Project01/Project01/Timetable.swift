//
//  Timetable.swift
//  Project01
//
//  Created by Natsuki Sawasaki on 2015/02/22.
//  Copyright (c) 2015年 Natsuki Sawasaki. All rights reserved.
//

import Foundation
import CoreData

class Timetable: NSManagedObject {

    @NSManaged var subject: String
    @NSManaged var room: String
    @NSManaged var day: String
    @NSManaged var toTask: Task

}
