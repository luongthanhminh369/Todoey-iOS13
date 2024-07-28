//
//  Data.swift
//  Todoey
//
//  Created by Nguyễn Thanh Minh on 26/07/2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift
class Data:Object{//là 1 lớp được sử dụng để xác định các đối tượng mô hình Realm
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}
