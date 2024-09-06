select 
ord.order_id,
CONCAT(cus.first_name,'',cus.last_name) as customer_name,
cus.city,
cus.state,
ord.order_date,sum(ite.quantity) as total_units,
sum(ite.quantity * ite.list_price) as revenue,
pro.product_name,
cat.category_name,
sst.store_name,
CONCAT(sti.first_name,' ',sti.last_name) as sales_rep
from sales.orders ord
join sales.customers cus
on ord.customer_id = cus.customer_id
join sales.order_items ite
on ord.order_id = ite.order_id
join production.products pro
on ite.product_id = pro.product_id
join production.categories cat
on pro.category_id = cat.category_id
join sales.stores sst
on ord.store_id = sst.store_id
join sales.staffs sti
on ord.staff_id = sti.staff_id
group by ord.order_id,
CONCAT(cus.first_name,'',cus.last_name),
cus.city,
cus.state,
ord.order_date,
pro.product_name,
cat.category_name,
sst.store_name,
CONCAT(sti.first_name,' ',sti.last_name)
order by 7