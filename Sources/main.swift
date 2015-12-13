//
//  main.swift
//  API
//
//  Created by Quentin Pré on 28/08/15.
//  Copyright © 2015 Quentin Pré. All rights reserved.
//

#if os(Linux)
import Glibc
srandom(UInt32(clock()))
#endif

import Foundation
import Swifter

let server = HttpServer()

do {
  server["/resources/:file"] = HttpHandlers.directory("public")
  server["/files/:path"]     = HttpHandlers.directoryBrowser("~/")
  server["/"]                = { r in
    return .OK(.Html("Welcome on Phubo's API (powered by Swifter (glock45 -> julien-c -> qpre))"))
  }

  let arguments   = Process.arguments
  let port        = Int(arguments[1])

  try server.start(in_port_t(port!))

  while true {
    sleep(1)
  }
} catch {
    print("Failed at starting")
}
