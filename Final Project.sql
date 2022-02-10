create database EPS;
use EPS;

#Query 1:
select eps_anal.Ticker, eps_anal.Analyst, 
analysts.Analyst_Confidence_Score, analysts.points, analysts.error_rate, analysts.Accuracy_Percentile
from eps_anal join analysts on eps_anal.Analyst = analysts.name
where eps_anal.Ticker = 'HZO'
order by eps_anal.Ticker, 
		analysts.Analyst_Confidence_Score DESC, 
		analysts.points DESC, 
		analysts.error_rate DESC, 
        analysts.Accuracy_Percentile DESC;
        
        
#Query 2:
select count(distinct company.Ticker), avg(Analysts), avg(Estimate_Consensus - Reported_Earnings)
from company join eps_info on company.Ticker = eps_info.Ticker
where industry = 'Specialty Retail'
group by industry;


#Query 3:
with A as ( select count(Analyst) as Num_anal, Ticker
			from eps_anal join analysts on eps_anal.Analyst = analysts.name
			where Analyst_Confidence_Score > 7
			group by Ticker)
select * from A
having A.Num_anal = (select max(A.Num_anal) from A);



#Query 4:
select Ticker, Followers
from company
where Followers = (select max(Followers) from company);
