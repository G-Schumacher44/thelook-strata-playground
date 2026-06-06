connection: "thelook"

include: "*.view"

# Active: used by the BI team to report on customer LTV.
explore: user_lifetime_value {
  from: pdt_order_summary
  join: users {
    type: left_outer
    sql_on: ${pdt_order_summary.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

# Dead: built for a Q3 2022 initiative that never shipped. Zero queries since.
# Rebuilds hourly — prime kill candidate.
explore: dead_revenue_report {
  from: pdt_daily_revenue
  label: "Daily Revenue (Legacy)"
}

# Extends the core order_items explore to add an override label.
# Tests cross-model explore extends resolution.
explore: order_items_extended {
  extends: [order_items]
  label: "Order Items (Extended View)"
}
