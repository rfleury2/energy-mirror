import React from 'react'
import CanvasJSReact from '../canvas_js/canvasjs.react'
import _ from 'lodash'

export default class BuildingChart extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      chartData: {}
    }
    // this.toggleDataSeries = this.toggleDataSeries.bind(this)
  }

 componentDidMount() {
   fetch(`/buildings/${this.props.buildingId}/chart_data`)
    .then((response) => response.json())
    .then((chartData) => {
      this.setState({
        chartData: chartData
      })
    })
 }

  toggleDataSeries(e) {
    if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
      e.dataSeries.visible = false
    }
    else {
      e.dataSeries.visible = true
    }
    this.chart.render()
  }

  parsedChartData() {
    const { chartData } = this.state
    const parsedChartData = _.map(chartData, (dataSeries) => {
      dataSeries.dataPoints = _.map(dataSeries.dataPoints, (dataPoint) => {
        const year = dataPoint.x.split('/')[0]
        const month = dataPoint.x.split('/')[1]
        return (
          { x: new Date(year, month), y: parseFloat(dataPoint.y) }
        )
      })
      return (dataSeries)
    })
    return (parsedChartData)
  }

  render() {
    const baseOptions = {
      theme: "light2",
      animationEnabled: true,
      exportEnabled: true,
      axisY: {
        title: "Total cost ($)"
      },
      toolTip: {
        shared: true
      },
      legend: {
        verticalAlign: "bottom",
        horizontalAlign: "bottom",
        reversed: true,
        cursor: "pointer",
        itemclick: (e) => this.toggleDataSeries(e)
      }
    }
    const options = { ...baseOptions, data: this.parsedChartData() }

    return (
      <div>
        <CanvasJSReact.CanvasJSChart options={options}
          onRef={ref => this.chart = ref}
          />
        {/*You can get reference to the chart instance as shown above using onRef. This allows you to access all chart properties and methods*/}
      </div>
    )
  }
}