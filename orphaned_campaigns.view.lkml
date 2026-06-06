view: orphaned_campaigns {
  sql_table_name: analytics.marketing_campaigns ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  measure: count {
    type: count
  }

  measure: total_spend {
    type: sum
    sql: ${TABLE}.spend ;;
    value_format: "$#,##0.00"
  }
}
