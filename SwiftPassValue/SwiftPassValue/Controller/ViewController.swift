//
//  ViewController.swift
//  SwiftPassValue
//
//  Created by KUN on 2018/12/16.
//  Copyright © 2018年 wushangkun. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let cellID = "ViewCell"

    lazy var tableView :UITableView = {
        var tableV = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableV .register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellID)
        tableV.tableFooterView = UIView.init()
        tableV.delegate = self
        tableV.dataSource = self
        view.addSubview(tableV)
        return tableV;
    }()
    
    lazy var dataArray = [
        MainItem(className:"DelegateViewController", title:"1.代理传值"),
        MainItem(className:"ClosureViewController", title:"2.闭包传值"),
        MainItem(className:"NotificationController", title:"3.通知传值"),
        MainItem(className:"SingletonViewController", title:"4.单例传值"),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PassValue"
        tableView .reloadData()
    }
    
    func controllerFromString(className :String) -> UIViewController {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls:AnyClass = NSClassFromString(namespace + "." + className)!
        let vc = (cls as! UIViewController.Type).init()
        return vc
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let item :MainItem = dataArray[indexPath.row]
        cell.textLabel?.text = item.title
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item :MainItem = dataArray[indexPath.row]
        tableView .deselectRow(at: indexPath, animated: true)
        let vc = controllerFromString(className:item.className)
        vc.title = item.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

