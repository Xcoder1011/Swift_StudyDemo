//
//  ViewController.swift
//  SwiftPassValue
//
//  Created by KUN on 2018/12/16.
//  Copyright © 2018年 wushangkun. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    let cellID = "ViewCell"

    lazy var tableView :UITableView = {
        var tableV = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        tableV .register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellID)
        tableV.tableFooterView = UIView.init()
        tableV.delegate = self
        tableV.dataSource = self
        self.view .addSubview(tableV)
        return tableV;
    }()
    lazy var dataArray = [
        MainItem(className:"DelegateViewController", title:"1.代理传值"),
        MainItem(className:"DelegateViewController", title:"2.闭包传值"),
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
        NSLog("select = %@", item.title)
        tableView .deselectRow(at: indexPath, animated: true)
        let vc = controllerFromString(className:item.className)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

