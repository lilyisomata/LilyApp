//
//  CheckViewSaveData.swift
//  Lily_app
//
//  Created by SoichiFurukawa on 2018/02/11.
//  Copyright © 2018年 soufuru. All rights reserved.
//

import UIKit
import RealmSwift

class CheckViewSaveData: Object {
    dynamic var title = ""
    var highrighted = List<highrightArray>()
    var text = List<textFieldArray>()
}

class highrightArray: Object {
    dynamic var highright1 = 0.0
    dynamic var highright2 = 0.0
}

class textFieldArray: Object {
    dynamic var text = ""
}

