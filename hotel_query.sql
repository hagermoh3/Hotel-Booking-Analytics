with hotels as (
Select * from dbo.['2018$']
union 
Select * from dbo.['2019$']
union
Select * from dbo.['2020$']
)

select * from hotels
left join dbo.market_segment$
on hotels.market_segment = market_segment$.market_Segment
left join dbo.meal_cost$
on meal_cost$.meal=hotels.meal

select arrival_date_year
,hotel
,round(sum((stays_in_week_nights + stays_in_weekend_nights)*adr),2) as revenue from hotels
group by arrival_date_year,hotel