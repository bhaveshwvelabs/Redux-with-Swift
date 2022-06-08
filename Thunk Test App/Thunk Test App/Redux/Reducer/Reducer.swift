//
//  Reducer.swift
//  Thunk Test App
//
//  Created by iOS Developer 3 on 07/06/22.
//

import Foundation
import ReSwift
import ReSwiftThunk

struct Reducer: Equatable {
   var names: [String] = []
}

func mainReducer(action: Action, state: Reducer?) -> Reducer {
   var state = state ?? Reducer()
   
   if let action = action as? HomeAction {
      switch action {
      case .addNames(let names):
         state.names.append(contentsOf: names)
      case .deleteName(let indx):
         state.names.remove(at: indx)
      }
   }
   
   return state
}
