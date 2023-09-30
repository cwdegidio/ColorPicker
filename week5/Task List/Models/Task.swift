//
//  Task.swift
//  Task List
//
//  Created by Curtis DeGidio on 9/28/23.
//

import Foundation

struct Task: Identifiable, Hashable {
    let id: UUID
    var title: String
    var notes: String
    var isCompleted: Bool
}
