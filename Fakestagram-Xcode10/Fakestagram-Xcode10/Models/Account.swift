//
//  Account.swift
//  Fakestagram-Xcode10
//
//  Created by Bruno Torres on 10/11/19.
//  Copyright © 2019 unam. All rights reserved.
//

import Foundation

struct Account: Codable {
    let id: String?
    let name: String
    let deviceNumber: String
    let deviceModel: String
}
