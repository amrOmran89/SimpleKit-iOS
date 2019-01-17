//
//  SKNotificationModel.swift
//  SimpleKit
//
//  Created by Amr Omran on 12/28/2018.
//

import Foundation

public struct SKNotificationModel {

    let title: String
    let subTitle: String
    let body: String

    let attachmentIdentifier: String
    let attachmentUrl: URL?

    let notificationIdentifier: String

    let timeInterval: Double
    let repeats: Bool

    let categoryIdentifiers: String

    let dismissActionTitle: String


    public init(title: String,
                subTitle: String,
                body: String,
                attachmentIdentifier: String,
                attachmentUrl: URL?,
                notificationIdentifier: String,
                timeInterval: Double,
                repeats: Bool,
                categoryIdentifiers: String,
                dismissActionTitle: String) {

        self.title = title
        self.subTitle = subTitle
        self.body = body
        self.attachmentIdentifier = attachmentIdentifier
        self.attachmentUrl = attachmentUrl
        self.notificationIdentifier = notificationIdentifier
        self.timeInterval = timeInterval
        self.repeats = repeats
        self.categoryIdentifiers = categoryIdentifiers
        self.dismissActionTitle = dismissActionTitle
    }
}
