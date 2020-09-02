//
//  Todo.swift
//  SwiftUIBestPractices
//
//  Created by Zien Solutions on 9/2/20.
//  Copyright © 2020 Trung Vo. All rights reserved.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
}
