module GraphsHelper
  def get_graph(ticker)
    ticker ||= 'AAPL'
    line_chart graph_data_api_graphs_path(ticker: ticker), customize(ticker)
  end

  private
  def customize(ticker)
    {
      id: "stock-graph",
      width: "500px",
      height: "300px",
      curve: false,
      library: {
        title: {
          text: ticker,
          x: -20
        },
        subtitle: {
          text: "as of #{l(Time.now, format: :us_date)}", x: -20
        },
        tooltip: {
                    valueSuffix: 'click(s)'
        },
        yAxis: {
                  # floor: 30, #must change to variable of upper_limit
                  # ceiling: 50, #must change to variable of lower_limit
                  title: {
                    text: 'Price Per Share'
                  }
        },
        xAxis: {
                crosshair: true,
                dateTimeLabelFormats: {
                    day: '%d %B'
                },
                type: 'datetime'
        },
        chart: {
                  zoomType: 'xy',
                  panning: true,
                  panKey: 'shift'
        }
      }
    }
  end
end
