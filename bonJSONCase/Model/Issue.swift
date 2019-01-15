//
//  Issue.swift
//  bonJSONCase
//
//  Created by a27 on 2019-01-15.
//  Copyright © 2019 a27. All rights reserved.
//

import Foundation

enum stateMessage: String, Codable {
    case toDo = "To do"
    case inProgress = "In progress"
    case done = "Done"
}

enum Function: String, Codable {
    case createIssue
    case deleteIssue
}

struct Issue: Codable {
    var title: String = ""
    var id: String = ""
    var state: stateMessage
    var creationDate: String = ""
    var comment: String = ""
    
    init(title: String ) {
        self.title = title
        self.state = .toDo
        self.id = self.makeId()
        self.creationDate = TimeStamp().getTimeStamp()
        self.comment = ""
    }
    
    func makeId () -> String {
        let uuid = UUID().uuidString
        return uuid
    }
}
