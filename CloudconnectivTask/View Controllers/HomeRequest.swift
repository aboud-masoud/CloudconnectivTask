//
//  HomeRequest.swift
//  CloudconnectivTask
//
//  Created by mac on 3/4/18.
//  Copyright © 2018 OrderEra. All rights reserved.
//

import Foundation

extension HomeViewController {
    
    func handleGetData(page: String, isLoadMore: Bool) {
        if SharedFunctions.checkInternrtConnection(baseController: self) {
            if !isLoadMore {
                PopupManager.showProgress(view: view)
            }
            APIClient.callGetService(type: .machine, attrebute: "page=\(page)", callback: { response,error  in
                if (response?.keys.contains("content"))! {
                    self.handleResponce(response: response!, isLoadMore:isLoadMore)
                }
                if !isLoadMore {
                    PopupManager.hideProgress(view: self.view)
                }
            })
        }else{
            PopupManager.showWarningMessage(message: NSLocalizedString("No internet connection", comment: "No internet connection"))
        }
    }
    
    
    private func handleResponce(response: Dictionary<String, Any>, isLoadMore:Bool) {
        guard let content = response["content"] as? Array<Dictionary<String, Any>> else {
            return
        }
        
        for dictContent in content {
            let decoder = JSONDecoder()
            let data = SharedFunctions.convertJsonToDataFrom(json: dictContent)
            do {
                let content = try decoder.decode(Content.self, from: data!)
                self.arrayOfContect.append(content)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        totalElements = response["totalElements"] as? Int
        tableView.reloadData()
    }
}
