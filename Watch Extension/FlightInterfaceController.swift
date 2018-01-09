//
//  FlightInterfaceController.swift
//  Watch Extension
//
//  Created by Ernesto Gonzalez on 11/28/17.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {

    @IBOutlet var flightLbl: WKInterfaceLabel!
    @IBOutlet var routeLbl: WKInterfaceLabel!
    @IBOutlet var boardingLbl: WKInterfaceLabel!
    @IBOutlet var boardTimeLbl: WKInterfaceLabel!
    @IBOutlet var statusLbl: WKInterfaceLabel!
    @IBOutlet var gateLbl: WKInterfaceLabel!
    @IBOutlet var seatLbl: WKInterfaceLabel!

    var flight: Flight? {
      didSet {
        guard let flight = flight else { return }

        flightLbl.setText("Flight \(flight.shortNumber)")
        routeLbl.setText(flight.route)
        boardingLbl.setText("\(flight.number) Boards")
        boardTimeLbl.setText(flight.boardsAt)

        if flight.onSchedule {
          statusLbl.setText("On Time")
        } else {
          statusLbl.setText("Delayed")
          statusLbl.setTextColor(.red)
        }

        gateLbl.setText("Gate \(flight.gate)")
        seatLbl.setText("Seat \(flight.seat)")
      }
    }
  
    override func awake(withContext context: Any?) {
      super.awake(withContext: context)
      if let flight = context as? Flight {
        self.flight = flight
      }
    }
}
