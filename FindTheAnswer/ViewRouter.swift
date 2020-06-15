//
//  ViewRouter.swift
//  FindTheAnswer
//
//  Created by Mario Alvarado on 6/14/20.
//  Copyright © 2020 Mario Alvarado. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<ViewRouter, Never>()
    
    var currentPage: String = "home" {
        didSet{
            objectWillChange.send(self)
        }
    }
}
