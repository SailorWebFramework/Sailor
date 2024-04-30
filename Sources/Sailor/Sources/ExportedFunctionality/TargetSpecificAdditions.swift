//
//  File.swift
//  
//
//  Created by Joshua Davis on 3/13/24.
//

import Sailboat
import SailorShared
#if os(WASI)
import SailorWeb
#else
#endif

#if os(WASI)
public typealias Env = SailorWeb.WebEnvironment
#else
public typealias Env = EmptyEnvironment
#endif


extension Page {
#if os(WASI)
    public var alert: (_ text: String) -> Void { SailorWeb.alert }
    public var confirm: (_ text: String) -> Bool { SailorWeb.confirm }
    public var prompt: (_ text: String) -> String { SailorWeb.prompt }
    public var setTimeout: (_ amount: Int, _ completion: @escaping () -> Void) -> Int { SailorWeb.setTimeout }
    public var clearTimeout: (_ timeoutID: Int) -> Void { SailorWeb.clearTimeout }
    public func fetch<ResponseType: Decodable>(url: String, format: ResponseType.Type, type: FetchType = .get, headers: [String: String] = [:], params: [String: String] = [:], body: [String: String] = [:], _ completion: @escaping (Promise<ResponseType>) -> Void) {
        SailorWeb.fetch(url: url, type: type, headers: headers, params: params, body: body, completion: completion)
    }
    public func fetch<ResponseType: Decodable>(url: String, format: ResponseType.Type, type: FetchType = .get, headers: [String: String] = [:], params: [String: String] = [:], body: [String: String] = [:]) async -> Promise<ResponseType>  {
        await SailorWeb.fetch(url: url, type: type, headers: headers, params: params, body: body)
    }
#else
    public var alert: (_ text: String) -> Void { fatalError("not implemented yet") }
    public var confirm: (_ text: String) -> Bool { fatalError("not implemented yet") }
    public var prompt: (_ text: String) -> String { fatalError("not implemented yet") }
    public var setTimeout: (_ amount: Int, _ completion: @escaping () -> Void) -> Int { fatalError("not implemented yet") }
    public var clearTimeout: (_ timeoutID: Int) -> Void { fatalError("not implemented yet") }
    public var fetch: (_ url: String) -> Void { fatalError("not implemented yet") }
    public func fetch<ResponseType: Decodable>(url: String, format: ResponseType.Type, type: FetchType = .get, headers: [String: String] = [:], params: [String: String] = [:], body: [String: String] = [:], _ completion: @escaping (Promise<ResponseType>) -> Void) {
        fatalError("not implemented yet")
    }
    public func fetch<ResponseType: Decodable>(url: String, format: ResponseType.Type, type: FetchType = .get, headers: [String: String] = [:], params: [String: String] = [:], body: [String: String] = [:]) async -> Promise<ResponseType>  {
        fatalError("not implemented yet")
    }
#endif

}

