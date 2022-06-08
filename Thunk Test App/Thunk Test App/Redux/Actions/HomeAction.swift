//
//  HomeAction.swift
//  Thunk Test App
//
//  Created by iOS Developer 3 on 07/06/22.
//

import Foundation
import ReSwift
import ReSwiftThunk

enum HomeAction: Action {
   case addNames([String])
   case deleteName(Int)
}

struct HomeViewState: Equatable {
   let names: [String]
   init(_ state: Reducer) {
      names = state.names
   }
}
