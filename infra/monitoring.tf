resource "google_monitoring_dashboard" "cluster_1" {
  project        = local.project_id
  dashboard_json = <<EOF
{
  "displayName": "GKE Cluster Overview",
  "dashboardFilters": [],
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "Node CPU Usage",
        "id": "",
        "xyChart": {
          "chartOptions": {
            "displayHorizontal": false,
            "mode": "COLOR",
            "showLegend": false
          },
          "dataSets": [
            {
              "breakdowns": [],
              "dimensions": [],
              "legendTemplate": "",
              "measures": [],
              "minAlignmentPeriod": "300s",
              "plotType": "LINE",
              "targetAxis": "Y1",
              "timeSeriesQuery": {
                "outputFullDuration": false,
                "timeSeriesFilter": {
                  "aggregation": {
                    "alignmentPeriod": "300s",
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [],
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"compute.googleapis.com/instance/cpu/usage_time\" resource.type=\"gce_instance\" metadata.user_labels.\"goog-k8s-cluster-name\"=\"cluster-1\""
                },
                "unitOverride": ""
              }
            }
          ],
          "thresholds": [],
          "yAxis": {
            "label": "",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Node Memory Usage",
        "xyChart": {
          "chartOptions": {
            "displayHorizontal": false,
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "300s",
              "plotType": "LINE",
              "targetAxis": "Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "alignmentPeriod": "300s",
                    "groupByFields": [],
                    "perSeriesAligner": "ALIGN_MEAN"
                  },
                  "filter": "metric.type=\"kubernetes.io/node/memory/used_bytes\" resource.type=\"k8s_node\" resource.label.\"cluster_name\"=\"cluster-1\""
                }
              }
            }
          ],
          "thresholds": [],
          "yAxis": {
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Pod CPU Usage",
        "xyChart": {
          "chartOptions": {
            "displayHorizontal": false,
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "300s",
              "plotType": "LINE",
              "targetAxis": "Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "alignmentPeriod": "300s",
                    "groupByFields": [],
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"kubernetes.io/container/cpu/core_usage_time\" resource.type=\"k8s_container\" resource.label.\"cluster_name\"=\"cluster-1\""
                }
              }
            }
          ],
          "thresholds": [],
          "yAxis": {
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Pod Memory Usage",
        "xyChart": {
          "chartOptions": {
            "displayHorizontal": false,
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "300s",
              "plotType": "LINE",
              "targetAxis": "Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "alignmentPeriod": "300s",
                    "groupByFields": [],
                    "perSeriesAligner": "ALIGN_MEAN"
                  },
                  "filter": "metric.type=\"kubernetes.io/container/memory/used_bytes\" resource.type=\"k8s_container\" resource.label.\"cluster_name\"=\"cluster-1\""
                }
              }
            }
          ],
          "thresholds": [],
          "yAxis": {
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Pod Restarts",
        "xyChart": {
          "chartOptions": {
            "displayHorizontal": false,
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "300s",
              "plotType": "LINE",
              "targetAxis": "Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "alignmentPeriod": "300s",
                    "groupByFields": [],
                    "perSeriesAligner": "ALIGN_DELTA"
                  },
                  "filter": "metric.type=\"kubernetes.io/container/restart_count\" resource.type=\"k8s_container\" resource.label.\"cluster_name\"=\"cluster-1\""
                }
              }
            }
          ],
          "thresholds": [],
          "yAxis": {
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Network Bytes Received",
        "xyChart": {
          "chartOptions": {
            "displayHorizontal": false,
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "300s",
              "plotType": "LINE",
              "targetAxis": "Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "alignmentPeriod": "300s",
                    "groupByFields": [],
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"kubernetes.io/pod/network/received_bytes_count\" resource.type=\"k8s_pod\" resource.label.\"cluster_name\"=\"cluster-1\""
                }
              }
            }
          ],
          "thresholds": [],
          "yAxis": {
            "scale": "LINEAR"
          }
        }
      }
    ]
  }
}
EOF
}



resource "google_monitoring_dashboard" "app_dashboard" {
  project        = local.project_id
  dashboard_json = <<EOF
{
  "displayName": "Application Performance Dashboard",
  "dashboardFilters": [],
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "Uptime Check",
        "xyChart": {
          "chartOptions": {
            "displayHorizontal": false,
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "60s",
              "plotType": "LINE",
              "targetAxis": "Y1",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "alignmentPeriod": "60s",
                    "crossSeriesReducer": "REDUCE_SUM",
                    "groupByFields": [],
                    "perSeriesAligner": "ALIGN_FRACTION_TRUE"
                  },
                  "filter": "metric.type=\"monitoring.googleapis.com/uptime_check/check_passed\" resource.type=\"uptime_url\" resource.label.\"host\"=\"34.49.149.29\""
                }
              }
            }
          ],
          "thresholds": [],
          "yAxis": {
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Request Latency (95th Percentile)",
        "scorecard": {
          "gaugeView": {
            "lowerBound": 0,
            "upperBound": 1
          },
          "thresholds": [],
          "timeSeriesQuery": {
            "outputFullDuration": true,
            "timeSeriesFilter": {
              "aggregation": {
                "alignmentPeriod": "60s",
                "crossSeriesReducer": "REDUCE_PERCENTILE_95",
                "groupByFields": [],
                "perSeriesAligner": "ALIGN_MEAN"
              },
              "filter": "metric.type=\"monitoring.googleapis.com/uptime_check/request_latency\" resource.type=\"uptime_url\" metric.label.\"check_id\"=monitoring.regex.full_match(\".*microservice-app.*\")"
            }
          }
        }
      },
      {
        "title": "HTTP Request Count",
        "scorecard": {
          "sparkChartView": {
            "sparkChartType": "SPARK_LINE"
          },
          "thresholds": [],
          "timeSeriesQuery": {
            "outputFullDuration": true,
            "timeSeriesFilter": {
              "aggregation": {
                "alignmentPeriod": "60s",
                "crossSeriesReducer": "REDUCE_SUM",
                "groupByFields": [],
                "perSeriesAligner": "ALIGN_RATE"
              },
              "filter": "metric.type=\"loadbalancing.googleapis.com/https/request_count\" resource.type=\"https_lb_rule\" resource.label.\"forwarding_rule_name\"=monitoring.regex.full_match(\".*microservice-app.*\")"
            }
          }
        }
      }
    ]
  }
}
EOF
}


resource "google_monitoring_uptime_check_config" "uptime_check" {
  display_name       = "microservice-app-uptime-check"
  project = local.project_id
  timeout            = "60s"
  log_check_failures = true

  http_check {
    path = "/users"
    port = "80"
    request_method = "GET"
    ping_config {
      pings_count = 1
    }
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      project_id = local.project_id
      host       = "34.49.149.29"
    }
  }

  checker_type = "STATIC_IP_CHECKERS"
}