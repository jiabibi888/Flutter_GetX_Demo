//
//  MyFlutterView.swift
//  Runner
//
//  Created by Jabir-Zhang on 2021/11/24.
//

import UIKit
import Flutter

class MyFlutterView: NSObject, FlutterPlatformView {
    func view() -> UIView {
        return label
    }
    
    let label = UILabel()
    
    init(_ frame: CGRect,viewID: Int64,args :Any?,messenger :FlutterBinaryMessenger) {
        label.text = "我是 iOS View"
        label.textColor = UIColor.white
    }
}
