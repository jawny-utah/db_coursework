class RequestsController < ApplicationController
  def index;end

  def get_request
    @description = "Get all scooters"
    @sql = "SELECT * from scooters"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def between_request
    @description = "Get all orders from last month"
    @sql = "SELECT * from orders WHERE started_at
            BETWEEN date_trunc('month', current_date - interval '1 month') AND date_trunc('month', current_date - interval '1 day')"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def in_request
    @description = "Get all 2 and 3 stars reviews"
    @sql = "SELECT * from reviews WHERE rate IN (2, 3)"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def like_request
    @description = "Get all sony model scooters"
    @sql = "SELECT * from scooters WHERE model LIKE '%Sony%'"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def two_condition_with_and_request
    @description = "Get all scooters with >25KM range and >300W power"
    @sql = "SELECT * from scooters WHERE range>25 AND power>300"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def two_condition_with_or_request
    @description = "Get all scooters with >45KM range or >570W power"
    @sql = "SELECT * from scooters WHERE range>45 OR power>570"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def distinct_request
    @description = "Get distinct scooters in work"
    @sql = "SELECT DISTINCT(scooters.model) from orders
            JOIN scooter_in_works ON scooter_in_works.id = orders.scooter_in_work_id
            JOIN scooters ON scooter_in_works.scooter_id = scooters.id"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def max_request
    @description = "Get max power scooter"
    @sql = "SELECT * FROM scooters WHERE power=(SELECT MAX(power) FROM scooters)"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def sum_request
    @description = "Get total sum from order for last month"
    @sql = "SELECT SUM(total_sum) FROM orders WHERE started_at
            BETWEEN date_trunc('month', current_date - interval '1 month') AND date_trunc('month', current_date - interval '1 day')"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def count_request
    @description = "Get total count of scooters in work where battery is > 50%"
    @sql = "SELECT COUNT(*) FROM scooter_in_works WHERE current_battery > 50"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def count_and_other_fields_request
    @description = "Get subscriptions name and count of clients that bought it"
    @sql = "SELECT subscriptions.name, COUNT(subscriptions.name) FROM client_subscriptions
            JOIN subscriptions ON client_subscriptions.subscription_id = subscriptions.id
            GROUP BY subscriptions.name"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def inner_join_with_condition_request
    @description = "Get distinct scooters in work only Canon model"
    @sql = "SELECT DISTINCT(scooters.model) from orders
            JOIN scooter_in_works ON scooter_in_works.id = orders.scooter_in_work_id
            JOIN scooters ON scooter_in_works.scooter_id = scooters.id
            WHERE scooters.model LIKE('%Canon%')"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def inner_request_with_condition
    @description = "Get orders where total sum bigger than 300"
    @sql = "SELECT #{client_full_name}, SUM(orders.total_sum) FROM orders
            JOIN clients ON clients.id = orders.client_id
            WHERE orders.id IN (SELECT id from orders where total_sum > 300)
            GROUP BY client_full_name"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def left_join_request
    @description = "Show all scooters and scooters in work"
    @sql = "SELECT scooters.model, scooter_in_works.id from scooters
            LEFT JOIN scooter_in_works ON scooter_in_works.scooter_id = scooters.id"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def right_join_request
    @description = "Show only subscribed clients"
    @sql = "SELECT #{client_full_name},
                   client_subscriptions.id, subscriptions.name from clients
                   RIGHT JOIN client_subscriptions ON client_subscriptions.client_id = clients.id
                   RIGHT JOIN subscriptions ON client_subscriptions.subscription_id = subscriptions.id"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def inner_join_with_aggregate_and_having_request
    @description = "Get total orders sum of clients who made more than 3 orders"
    @sql = "SELECT clients.id AS client_id, #{client_full_name},
                   COUNT(orders.id) AS orders_count, SUM(orders.total_sum) as total_orders_sum
                   FROM clients
                   JOIN orders ON orders.client_id = clients.id
                   GROUP BY clients.id, client_full_name
                   HAVING COUNT(orders.id) > 3"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def exist_request
    @description = "Get clients that have at least one order"
    @sql = "SELECT * FROM clients
            WHERE EXISTS (SELECT 1 FROM orders WHERE orders.client_id = clients.id)"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def any_request
    @description = "Get all scooters that have scooters in work"
    @sql = "SELECT * FROM scooters
            WHERE id = ANY (SELECT scooter_id FROM scooter_in_works)"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def inner_join_in_subquery_request
    @description = "Get all clients that made orders in previous month"
    @sql = "SELECT * FROM clients
            WHERE id IN (SELECT orders.client_id FROM orders
                        JOIN clients ON orders.client_id = clients.id
                        WHERE orders.ended_at BETWEEN date_trunc('month', current_date - interval '1 month') AND date_trunc('month', current_date - interval '1 day'))"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  def aggregate_function_with_condition_and_ordering_request
    @description = "Show all clients that made order for more than 1000 in total"
    @sql = "SELECT #{client_full_name}, SUM(orders.total_sum) as total_order_sum
            FROM orders
            JOIN clients ON clients.id = orders.client_id
            GROUP BY client_full_name
            HAVING SUM(orders.total_sum) > 1000
            ORDER BY total_order_sum DESC"
    @records = ActiveRecord::Base.connection.exec_query(@sql)

    render "default_response"
  end

  private

  def client_full_name
    "CONCAT(clients.first_name, ' ', clients.last_name) AS client_full_name"
  end
end
