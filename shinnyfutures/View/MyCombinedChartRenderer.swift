//
//  MyCombinedChartRenderer.swift
//  shinnyfutures
//
//  Created by chenli on 2018/5/24.
//  Copyright © 2018年 xinyi. All rights reserved.
//

import UIKit
import Charts

open class MyCombinedChartRenderer: CombinedChartRenderer {

    override init(chart: CombinedChartView, animator: Animator, viewPortHandler: ViewPortHandler) {
        super.init(chart: chart, animator: animator, viewPortHandler: viewPortHandler)
    }
    
    override open func createRenderers()
    {
        _renderers = [DataRenderer]()
        
        guard let chart = chart else { return }
        
        for order in drawOrder
        {
            switch (order)
            {
            case .bar:
                if chart.barData !== nil
                {
                    _renderers.append(BarChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
                break
                
            case .line:
                if chart.lineData !== nil
                {
                    _renderers.append(LineChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
                break
                
            case .candle:
                if chart.candleData !== nil
                {
                    //使用自定义的蜡烛图渲染器
                    _renderers.append(MyCandleStickChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
                break
                
            case .scatter:
                if chart.scatterData !== nil
                {
                    _renderers.append(ScatterChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
                break
                
            case .bubble:
                if chart.bubbleData !== nil
                {
                    _renderers.append(BubbleChartRenderer(dataProvider: chart, animator: animator, viewPortHandler: viewPortHandler))
                }
                break
            }
        }
        
    }
    
}
