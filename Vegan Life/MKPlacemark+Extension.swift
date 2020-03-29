//
//  MKPlacemark+Extension.swift
//  Vegan Life
//
//  Created by Danyaal Kapadia on 25/03/2020.
//  Copyright © 2020 Danyaal. All rights reserved.
//

import MapKit
import Contacts

extension MKPlacemark {
    var formattedAddress: String? {
        guard let postalAddress = postalAddress else { return nil }
        return CNPostalAddressFormatter.string(from: postalAddress,
            style: .mailingAddress).replacingOccurrences(of: "/n", with: " ")
    }
}
