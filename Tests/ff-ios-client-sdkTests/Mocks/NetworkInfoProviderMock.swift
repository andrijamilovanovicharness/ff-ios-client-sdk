//
//  NetworkInfoProviderMock.swift
//  ff_ios_client_sdkTests
//
//  Created by Dusan Juranovic on 26.2.21..
//

import Foundation
@testable import ff_ios_client_sdk

class ReachabilityMock {
	var whenReachable: ((Bool)->())?
	var whenUnreachable: ((Bool)->())?
	
	func startNotifier() {
		whenReachable?(true)
	}
	
	func stopNotifier() {
		whenUnreachable?(false)
	}
}
class NetworkInfoProviderMock: NetworkInfoProviderProtocol {
	var isReachable: Bool {
		return true
	}
	
	private var reachability = ReachabilityMock()
	
	func networkStatus(_ completion:@escaping(Bool)->()) {
		reachability.whenReachable = { _ in
			completion(true)
		}
		
		reachability.whenUnreachable = { _ in
			completion(false)
		}
	}
	
	func startNotifier() {
		reachability.startNotifier()
	}
	
	func stopNotifier() {
		reachability.stopNotifier()
	}
}
