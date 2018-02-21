//
//  QueryRequest.swift
//  ActivityLabeling
//
//  Created by Wataru Sasaki on 2018/02/12.
//  Copyright © 2018年 Wataru Sasaki. All rights reserved.
//

import APIKit

class QueryRequest: InfluxDBRequest {
    let influxdb: InfluxDBClient
    
    let query: String
    let database: String?
    
    init(influxdb: InfluxDBClient, query: String, database: String? = nil) {
        self.influxdb = influxdb
        self.query = query
        self.database = database
    }
    
    var method = HTTPMethod.post
    var path = "/query"
    
    var queryParameters: [String: Any]? {
        var params: [String: Any] = [:]
        params["q"] = self.query
        if let user = self.influxdb.user {
            params["u"] = user
        }
        if let password = self.influxdb.password {
            params["p"] = password
        }
        if let database = self.database {
            params["db"] = database
        }
        return params
    }
}
