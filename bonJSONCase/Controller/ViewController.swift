//
//  ViewController.swift
//  bonJSONCase
//
//  Created by a27 on 2019-01-15.
//  Copyright © 2019 a27. All rights reserved.
//

import UIKit

struct CreateIssue: Codable {
    let function: Function
    let title: String
}

class ViewController: UIViewController {
    let decoder = JSONDecoder()
    var issueArray: [Issue] = []
//    Creating a raw JSON String as input
    let dataCreateIssue = """
            {
            "function": "createIssue",
            "title": "Anything goes"
            }
            """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createIssueObjectFromJSON(jsonData: dataCreateIssue)
    }
    
    func createJSONFromIssueObject(issue: Issue) {
        do {
            let encodedObject = try JSONEncoder().encode(issue)
            if let encodedObjectJsonString = String(data: encodedObject, encoding: .utf8) {
                print(encodedObjectJsonString)
                //I dont find anywhere how to encode specific variables from the issue object
            }
        } catch {
            print("Failed to encode JSON")
        }
    }
    
    func createIssueObjectFromJSON(jsonData: String) {
        if let jsonData = jsonData.data(using: .utf8) {
            do {
                let issueObject = try JSONDecoder().decode(CreateIssue.self, from: jsonData)
                switch issueObject.function {
                case .createIssue:
                    let newIssue = Issue(title: issueObject.title)
                    issueArray.append(newIssue)
                    createJSONFromIssueObject(issue: newIssue)
                case .deleteIssue:
                    print("Deleted")
                }
            } catch {
                print("Failed to decode JSON")
            }
        }
    }
}































//    func createIssue(title: String) {
//        let dataCreateIssue = """
//            "function": "createIssue",
//            "title": "\(title)"
//    """
//
//        //Not Safe yet, make it safe
////        if let newIssue = try? decoder.decode(Issue.self, from: dataCreateIssue) {
////                issueArray.append(newIssue)
////        }
//
//        if let jsonData = dataCreateIssue.data(using: .utf8) {
//            if let input = try? JSONDecoder().decode(Issue.self, from: jsonData) {
//                print(input)
//
//            }
//        }
//    }

