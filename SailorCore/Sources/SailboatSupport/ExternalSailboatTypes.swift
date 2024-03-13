//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

import Sailboat

#if os(WASI)
import SailorWeb

public typealias Environment<EnvValue> = Sailboat.Environment<WebEnvironment, EnvValue>

#else
//
#endif


public typealias Page = Sailboat.Page
public typealias State = Sailboat.State
public typealias Binding = Sailboat.Binding
public typealias EnvironmentObject = Sailboat.EnvironmentObject

//public typealias Navigator<EnvRoutes: Routes, EnvValue> = Sailboat.Environment<WebEnvironment<EnvRoutes>, EnvValue>
//public typealias Environment<Value> = Sailboat.Environment<WebEnvironment<NoRoutes>, Value>


//public typealias Routes = Sailboat.Routes
//public typealias Navigation<MyRoutes: Routes> = Sailboat.Navigation<MyRoutes>

public typealias BidirectionalDictionary = Sailboat.BidirectionalDictionary



//public typealias List = Sailboat.List

