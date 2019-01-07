//
//  SKiPhoneSceenType.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/05/2019.
//

import Foundation

public class SKiPhone {
    
    public init() {}
    
    /**
     ScreenFamily enum.
     - Returns: iPhone screen families.
     */
    public var screenFamily: ScreenFamily {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
                case 1136:
                    return ScreenFamily.iPhone_5_5s_SE
                case 1334:
                    return ScreenFamily.iPhone_6_7_8
                case 2208:
                    return ScreenFamily.iPhone_6_7_8_plus
                case 2436:
                    return ScreenFamily.iPhoneX
                default:
                    return ScreenFamily.unknown
            }
        }
        return ScreenFamily.unknown
    }
    
}

public enum ScreenFamily {
    case iPhone_5_5s_SE
    case iPhone_6_7_8
    case iPhone_6_7_8_plus
    case iPhoneX
    case unknown
}
