//
//  CallbackObjects.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 10/06/22.
//

import Foundation

public typealias YZFirebaseUserCallback<T: Swift.Error> = ((Result<T, Swift.Error>) -> Void)
