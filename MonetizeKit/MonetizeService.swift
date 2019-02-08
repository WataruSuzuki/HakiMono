//
//  MonetizeService.swift
//  MonetizeKit
//
//  Created by 鈴木 航 on 2019/03/31.
//  Copyright © 2019 WataruSuzuki. All rights reserved.
//

import UIKit
import GoogleMobileAds

public class MonetizeService: NSObject {

    let ADMOB_APP_ID = "ca-app-pub-3940256099942544~1458002511"
    public func start() {
        GADMobileAds.configure(withApplicationID: ADMOB_APP_ID)
    }
}
