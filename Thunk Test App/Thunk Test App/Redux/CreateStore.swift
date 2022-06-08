//
//  CreateStore.swift
//  Thunk Test App
//
//  Created by iOS Developer 3 on 07/06/22.
//

import Foundation
import ReSwift
import ReSwiftThunk

let thunksMiddleware: Middleware<Reducer> = createThunkMiddleware()
let reduxStore = Store(
   reducer: mainReducer,
   state: Reducer(),
   middleware: [thunksMiddleware]
)
