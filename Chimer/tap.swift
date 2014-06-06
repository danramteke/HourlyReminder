//
//  tap.swift
//  Chimer
//
//  Created by Daniel R on 6/6/14.
//  Copyright (c) 2014 Dan Ramteke Consulting, Inc. All rights reserved.
//

import Foundation

func tap<T>(object:T, block:(T)->()) -> T {
    block(object)
    return object
}