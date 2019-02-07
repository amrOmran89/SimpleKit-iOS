//
//  SKiPhoneSceenType.swift
//  SimpleKit
//
//  Created by Amr Omran on 01/05/2019.
//

import Foundation

public struct IphoneScreenSize {
    
    /**
     ScreenFamily enum.
     - Returns: iPhone screen families.
     */
    public var getScreen: ScreenSize {
        
        if UIDevice().userInterfaceIdiom == .phone {
            
            switch UIScreen.main.nativeBounds.height {
                case 1136:
                    return ScreenSize.iPhone_5_5s_SE
                case 1334:
                    return ScreenSize.iPhone_6_7_8
                case 2208:
                    return ScreenSize.iPhone_6_7_8_plus
                case 2436:
                    return ScreenSize.iPhoneX
                default:
                    return ScreenSize.unknown
            }
        }
        return ScreenSize.unknown
    }
    
}

public enum ScreenSize {
    case iPhone_5_5s_SE
    case iPhone_6_7_8
    case iPhone_6_7_8_plus
    case iPhoneX
    case unknown
}
