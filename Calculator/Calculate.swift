//
//  Calculate.swift
//  Calculator
//
//  Created by 성곤 김 on 2018. 7. 12..
//  Copyright © 2018년 SeongKon Kim. All rights reserved.
//

import Foundation

class Calculate{
    
    static func arithmetic(formula : String, tag : Int) -> String{
        
        var result : Double = 0
        let expr = NSExpression(format: formula)
        if let x = expr.expressionValue(with: nil, context: nil) as? NSNumber {
            result = x.doubleValue
        }
        return String(result)
    }
}
