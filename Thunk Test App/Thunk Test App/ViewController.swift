//
//  ViewController.swift
//  Thunk Test App
//
//  Created by iOS Developer 3 on 07/06/22.
//

import UIKit
import ReSwift

class ViewController: UIViewController {

   //MARK: - IBOutlets
   
   @IBOutlet weak var tblHome: UITableView!

   //MARK: - Variables
   
   var arrNames = [String]()

   //MARK: - View Life Cycle
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      reduxStore.subscribe(self, transform: {
          $0.select(HomeViewState.init)
      })
   }
   
//   override func viewWillAppear(_ animated: Bool) {
//       super.viewWillAppear(animated)
//       reduxStore.subscribe(self, transform: {
//           $0.select(HomeViewState.init)
//       })
//   }
//
//   override func viewWillDisappear(_ animated: Bool) {
//       super.viewWillDisappear(animated)
//      reduxStore.unsubscribe(self)
//   }
   
   deinit {
      reduxStore.unsubscribe(self)
   }
   
   //MARK: - IBActions

   @IBAction func btnAddNewItemsPressed(_ sender: UIBarButtonItem) {
      reduxStore.dispatch(fetchData)
   }
}

extension ViewController: StoreSubscriber {
    typealias StoreSubscriberStateType = HomeViewState

    func newState(state: HomeViewState) {
       print("Home Screen State ---> ", state)
       arrNames = state.names
       tblHome.reloadData()
       
       //NoData
       if arrNames.count == 0 {
          let lblNoData = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: tblHome.frame.height - 100))
          lblNoData.textAlignment = .center
          lblNoData.font = UIFont(name: lblNoData.font.fontName, size: 100)
          lblNoData.text = "🫙"
          tblHome.tableFooterView = lblNoData
       } else {
          tblHome.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 150))
       }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
   //MARK: - UITableViewDelegate
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return UITableView.automaticDimension
   }
   
   func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
      return UITableView.automaticDimension
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tblHome.reloadData()
   }
   
   func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
      return .none
   }

   func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
         reduxStore.dispatch(deleteData(indexPath.row))
      }
      let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
      return swipeActions
   }
   
   //MARK: - UITableViewDataSource
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return arrNames.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let aCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      aCell.textLabel?.text = arrNames[indexPath.row]
      return aCell
   }
}

