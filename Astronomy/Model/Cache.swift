//
//  PhotoCache.swift
//  Astronomy
//
//  Created by Andrew R Madsen on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class Cache<Key: Hashable, Value> {
    
    // Race Condition - > when two threads try to modify the cache
    // Non - determinitstic bug
    func cache(value: Value, for key: Key) {
        
        // serial ->
        // concurrent ->
        
        // sync.async will both add the following block to the queue
        // how many blocks are there in the queue?
        queue.async {
            self.cache[key] = value
        }
        // sync -> line 25 will execute after the above closure
        // sync means we must wait for the closure to finish executing
        
        // async -> line 25 will execute
    
    }
    
    func value(for key: Key) -> Value? {
        // return queue.sync { return cache[key] }
        return queue.sync { cache[key] }
    }
    
    private let queue = DispatchQueue(label: "Cache \(Cache.self)")
    private var cache = [Key : Value]()
}
