//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/27/24.
//

import JavaScriptKit
import JavaScriptEventLoop
import Sailboat
import SailorShared

// JavascriptKit Passthrough

public func alert(_ text: String) { JSObject.global.alert.function?(text) }

public func confirm(_ text: String) -> Bool { JSObject.global.confirm.function?(text).boolean ?? false }

public func prompt(_ text: String) -> String { JSObject.global.prompt.function?(text).string ?? "" }

public func setTimeout(_ amount: Int, completion: @escaping () -> Void) -> Int {
    Int(
        JSObject.global.setTimeout.function!(JSClosure { _ in
            completion()
            // TODO: decide if this is good, does not register because its async
            SailboatGlobal.manager.eventScheduler.update()
            return .undefined
        }, amount).number ?? 0.0
    )
}

public func clearTimeout(_ timeoutID: Int) {
    JSObject.global.clearTimeout.function!(Double(timeoutID))
}



//struct FetchError: Error {
//    
//}


internal func fetchPromise(_ url: String, _ requestOptions: JSObject) -> JSPromise {
    JSPromise(JSNode.jsFetch(url, requestOptions).object!)!
}

//func fetch(_ url: String) -> Future<[String:Any], Error> {
//    Future { promise in
//        Task {
//            do {
//                let response = try await(fetchPromise(url)).value
//                let json = try await JSPromise(response.json().object!)!.value
//                promise(.success(jsonDict))
//                
//            } catch {
//                promise(.failure(error))
//            }
//        }
//    }
//}

//public func fetch<ResponseType: Decodable>(_ url: String) -> Future<ResponseType, Error> {
//    Future { promise in
//        Task {
//            do {
//                let response = try await(fetchPromise(url)).value
//                let json = try await JSPromise(response.json().object!)!.value
//                let parsedResponse = try JSValueDecoder().decode(ResponseType.self, from: json)
//                promise(.success(parsedResponse))
//                
//            } catch {
//                promise(.failure(error))
//            }
//        }
//    }
//}

public func fetch<ResponseType: Decodable>(url: String, type: FetchType = .get, headers: [String: String] = [:], params: [String: String] = [:], body: [String: String] = [:], completion: @escaping (Promise<ResponseType>) -> Void) {
    Task {
        do {
            var formattedURL = url
            let requestOptions = JSObject.global.Object.function!.new()
            
            requestOptions["method"] = .string(type.rawValue.uppercased())

            if !params.isEmpty {
                // add params
                let jsparams = JSNode.URLSearchParams.new("")
                for param in params.keys {
                    jsparams.append!(param, params[param]!)
                }
                
                formattedURL += "?\(jsparams.toString?().string ?? "")"
            }
            if !headers.isEmpty {
                // Prepare the headers
                let headersObject: JSObject = JSObject.global.Object.function!.new()
                for headerKey in headers.keys {
                    headersObject[headerKey] = .string(headers[headerKey]!)
                }
                
                requestOptions["headers"] = .object(headersObject)
            }

            if !body.isEmpty {
                let bodyObject: JSObject = JSObject.global.Object.function!.new()
                for bodyKey in body.keys {
                    bodyObject[bodyKey] = .string(body[bodyKey]!)
                }
                
                if let jsonString = JSNode.JSON.stringify(bodyObject).string {
                    requestOptions["body"] = .string(jsonString)
                }
            }

            let response = try await(fetchPromise(formattedURL, requestOptions)).value
            let json = try await JSPromise(response.json().object!)!.value
            let parsedResponse = try JSValueDecoder().decode(ResponseType.self, from: json)
            completion(.success(parsedResponse))
            // TODO: do i need this?
            SailboatGlobal.manager.eventScheduler.update()

        } catch {
            completion(.failure(error))
            SailboatGlobal.manager.eventScheduler.update()
        }
    }
}


public func fetch<ResponseType: Decodable>(url: String, type: FetchType = .get, headers: [String: String] = [:], params: [String: String] = [:], body: [String: String] = [:]) async -> Promise<ResponseType>  {
    do {
        var formattedURL = url
        let requestOptions = JSObject.global.Object.function!.new()
        
        requestOptions["method"] = .string(type.rawValue.uppercased())
        
        if !params.isEmpty {
            // add params
            let jsparams = JSNode.URLSearchParams.new("")
            for param in params.keys {
                jsparams.append!(param, params[param]!)
            }
            
            formattedURL += "?\(jsparams.toString?().string ?? "")"
        }
        if !headers.isEmpty {
            // Prepare the headers
            let headersObject: JSObject = JSObject.global.Object.function!.new()
            for headerKey in headers.keys {
                headersObject[headerKey] = .string(headers[headerKey]!)
            }
            
            requestOptions["headers"] = .object(headersObject)
        }
        
        if !body.isEmpty {
            let bodyObject: JSObject = JSObject.global.Object.function!.new()
            for bodyKey in body.keys {
                bodyObject[bodyKey] = .string(body[bodyKey]!)
            }
            
            if let jsonString = JSNode.JSON.stringify(bodyObject).string {
                requestOptions["body"] = .string(jsonString)
            }
        }
        
        let response = try await(fetchPromise(formattedURL, requestOptions)).value
        let json = try await JSPromise(response.json().object!)!.value
        let parsedResponse = try JSValueDecoder().decode(ResponseType.self, from: json)
        SailboatGlobal.manager.eventScheduler.update()
        return .success(parsedResponse)
    } catch {
        SailboatGlobal.manager.eventScheduler.update()
        return .failure(error)
    }
}

//func convertJSObjectToDictionary(_ jsObject: JSObject) -> [String: Any] {
//    var dictionary: [String: Any] = [:]
////    JSObject.keys(jsObject).compactMap {}
////    for key in  {
////        let value = jsObject[key]
////        dictionary[key] = convertJSValueToSwift(value)
////    }
////    
//    return dictionary
//}
