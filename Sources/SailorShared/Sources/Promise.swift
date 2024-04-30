//
//  File.swift
//  
//
//  Created by Joshua Davis on 4/26/24.
//

public enum Promise<ResponseType> {
    case success(ResponseType)
    case failure(any Error)
}

public enum FetchType: String {
    case get, post, patch, options, put, delete, head
}
