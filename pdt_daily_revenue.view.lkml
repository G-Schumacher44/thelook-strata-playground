view: pdt_daily_revenue {
  derived_table: {
    sql: SELECT
           DATE(created_at)  AS revenue_date,
           SUM(sale_price)   AS daily_revenue,
           COUNT(DISTINCT order_id) AS order_count
         FROM ${order_items.SQL_TABLE_NAME}
         GROUP BY 1 ;;
    sql_trigger_value: SELECT FLOOR(UNIX_TIMESTAMP(NOW()) / 3600) ;;
  }

  dimension: revenue_date {
    type: date
    sql: ${TABLE}.revenue_date ;;
  }

  measure: daily_revenue {
    type: sum
    sql: ${TABLE}.daily_revenue ;;
    value_format: "$#,##0.00"
  }

  measure: order_count {
    type: sum
    sql: ${TABLE}.order_count ;;
  }
}
