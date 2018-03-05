//
//  HomeTableDelegate.swift
//  CloudconnectivTask
//
//  Created by mac on 3/4/18.
//  Copyright © 2018 OrderEra. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfContect.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Handle Pagenation
        if indexPath.row == arrayOfContect.count - 1 {
            if totalElements! > arrayOfContect.count {
                return handleShowingLoadMoreView()
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeViewCell
        cell.ipAddress.text = arrayOfContect[indexPath.row].ipAddress
        cell.profileTitle.text = arrayOfContect[indexPath.row].name
        cell.deviceIPSubnetMask.text = arrayOfContect[indexPath.row].ipSubnetMask
        cell.statusView.backgroundColor = handleStatusViewColor(index: indexPath.row)
        return cell
    }
    
    private func handleStatusViewColor(index: Int) -> UIColor {
        switch arrayOfContect[index].Status! {
        case 1:
            return .green
        case 2:
            return .orange
        case 3:
            return .yellow
        case 4:
            return .red
        default:
            return .gray
        }
    }
    
    private func handleShowingLoadMoreView() -> UITableViewCell {
        let cellLoading = tableView.dequeueReusableCell(withIdentifier: "loadMoreCell") as! LoadMoreCell
        loadMoreRequest()
        return cellLoading
    }
    
    private func loadMoreRequest() {
        counterOfPagenation += 1
        handleGetData(page: "\(counterOfPagenation)", isLoadMore: true)
    }
}
