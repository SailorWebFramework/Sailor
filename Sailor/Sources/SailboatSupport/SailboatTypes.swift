//
//  File.swift
//  
//
//  Created by Joshua Davis on 12/29/23.
//

import Sailboat

public typealias Page = Sailboat.Page
public typealias State = Sailboat.State
public typealias Binding = Sailboat.Binding
public typealias Environment<EnvRoutes: Routes, EnvValue> = Sailboat.Environment<SailorEnvironment<EnvRoutes>, EnvValue>

public typealias Routes = Sailboat.Routes
public typealias Navigation<MyRoutes: Routes> = Sailboat.Navigation<MyRoutes>
