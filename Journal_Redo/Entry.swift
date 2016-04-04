//
//  Entry.swift
//  Journal_Redo
//
//  Created by Diego Aguirre on 4/4/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation

struct Entry: Equatable {

    let body: String
    let date: NSDate
    
    init(body: String, date: NSDate) {
        self.body = body
        self.date = date
    }
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return (lhs.body == rhs.body) && (lhs.date == rhs.date)
}