//
//  MyFlutterViewFactory.swift
//  Runner
//
//  Created by Jabir-Zhang on 2021/11/24.
//

import UIKit
import Flutter

class MyFlutterViewFactory: NSObject, FlutterPlatformViewFactory {
    var messenger:FlutterBinaryMessenger
    
    init(messenger:FlutterBinaryMessenger) {
            self.messenger = messenger
            super.init()
        }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return MyFlutterView(frame,viewID: viewId,args: args,messenger: messenger)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
            return FlutterStandardMessageCodec.sharedInstance()
        }

}
