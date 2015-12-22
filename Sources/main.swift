//
//  main.swift
//  API
//
//  Created by Quentin Pré on 28/08/15.
//  Copyright © 2015 Quentin Pré. All rights reserved.
//

#if os(Linux)
  import Glibc
#else
  import Darwin.C
#endif

import Octopus

print("starting Phubo API")

do {
  let arguments   = Process.arguments

  print("port: String -> Int")
  let port        = Int(arguments[1])

  print("instantiating new OctopusServer")
  let server      = OctopusServer(port: in_port_t(port!))

  try server.start()

  while true {
    sleep(1)
  }
} catch {
    print("Failed at starting Phubo API")
}
