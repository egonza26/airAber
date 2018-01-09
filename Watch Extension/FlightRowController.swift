//
//  FlightRow.swift
//  Watch Extension
//
//  Created by Ernesto Gonzalez on 11/28/17.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit

class FlightRowController: NSObject {

  @IBOutlet var separator: WKInterfaceSeparator!
  @IBOutlet var originLbl: WKInterfaceLabel!
  @IBOutlet var destinationLbl: WKInterfaceLabel!
  @IBOutlet var flightNumberLbl: WKInterfaceLabel!
  @IBOutlet var statusLbl: WKInterfaceLabel!
  @IBOutlet var planeImg: WKInterfaceImage!

  var flight: Flight? {
    didSet {
      guard let flight = flight else { return }

      originLbl.setText(flight.origin)
      destinationLbl.setText(flight.destination)
      flightNumberLbl.setText(flight.number)

      if flight.onSchedule {
        statusLbl.setText("On Time")
      } else {
        statusLbl.setText("Delayed")
        statusLbl.setTextColor(.red)
      }
    }
  }
}
