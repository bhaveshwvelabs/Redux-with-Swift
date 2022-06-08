//
//  Thunk.swift
//  Thunk Test App
//
//  Created by iOS Developer 3 on 07/06/22.
//

import Foundation
import ReSwiftThunk

let arrNames = ["Furkan", "Divyesh", "Purvesh", "Anish", "Bhavesh", "Tabrez", "Nisarg", "Asha", "Aksha", "Hitesh"]

let fetchData = Thunk<Reducer> { dispatch, getState in
   DispatchQueue.main.async {
      dispatch(
         HomeAction.addNames([arrNames[Int(arc4random_uniform(UInt32(arrNames.count)))]])
      )
   }
}

func deleteData(_ indx: Int) -> Thunk<Reducer> {
   return Thunk<Reducer> { dispatch, getState in
      DispatchQueue.main.async {
         dispatch(
            HomeAction.deleteName(indx)
         )
      }
   }
}
