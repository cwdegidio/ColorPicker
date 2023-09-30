//
//  InitialTasks.swift
//  Task List
//
//  Created by Curtis DeGidio on 9/29/23.
//

import Foundation

let defaultData = [
    Task(
        id: UUID(),
        title: "Count treasure",
        notes: """
        Copper Pieces: 34,234\n
        Silver Pieces: 2,392\n
        Electrum Pieces: 1,067\n
        Gold Pieces: 892\n
        Platinum Pieces: 78\n
        -----\n
        Precious Stones:\n
        TBD\n
        """,
        isCompleted: false
    ),
    Task(
        id: UUID(),
        title: "Slay Dragon",
        notes: "I should probably buy a 🗡️sword🗡️",
        isCompleted: false
    ),
    Task(
        id: UUID(),
        title: "Feed 🧊Gelatinous Cube🧊",
        notes: "",
        isCompleted: false
    ),
    Task(
        id: UUID(),
        title: "Recharge wand of magic missile",
        notes: "Where is the USB-C port?!",
        isCompleted: true
    ),
    Task(
        id: UUID(),
        title: "Prepare spells",
        notes: "Don't forget fireball this time!",
        isCompleted: false
    ),
]
