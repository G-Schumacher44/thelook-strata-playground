view: pdt_order_summary {
  derived_table: {
    sql: SELECT
           user_id,
           COUNT(*)        AS order_count,
           SUM(sale_price) AS lifetime_value
         FROM ${order_items.SQL_TABLE_NAME}
         GROUP BY 1 ;;
    sql_trigger_value: SELECT CURRENT_DATE() ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: order_count {
    type: sum
    sql: ${TABLE}.order_count ;;
  }

  measure: lifetime_value {
    type: sum
    sql: ${TABLE}.lifetime_value ;;
    value_format: "$#,##0.00"
  }
}
