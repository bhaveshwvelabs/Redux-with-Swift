//
//  DetailsVC.swift
//  Thunk Test App
//
//  Created by iOS Developer 3 on 07/06/22.
//

import UIKit
import ReSwift

class DetailsVC: UIViewController {

   //MARK: - IBOutlets
   
   @IBOutlet weak var txtViewDetails: UITextView!
   
   //MARK: - Variables
   
   //MARK: - View Life Cycle
   
   override func viewDidLoad() {
      super.viewDidLoad()
      /* Initial setup when view load */
      doInitialSettings()
   }
   
   deinit {
      reduxStore.unsubscribe(self)
   }
   
   //MARK: - IBActions
   
   @IBAction func btnAddNewItemsPressed(_ sender: UIBarButtonItem) {
      reduxStore.dispatch(fetchData)
   }
   
   //MARK: - Class Functions
   
   /// Initial settings when view loads
   func doInitialSettings() {
      reduxStore.subscribe(self, transform: {
          $0.select(HomeViewState.init)
      })
   }
   
   /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    }
    */
}
extension DetailsVC: StoreSubscriber {
    typealias StoreSubscriberStateType = HomeViewState

    func newState(state: HomeViewState) {
       print("Details Screen State ---> ", state)
       txtViewDetails.text = state.names.joined(separator: "\n")
    }
}
