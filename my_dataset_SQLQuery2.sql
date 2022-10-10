Select *from project..dataset1;

Select *from project..dataset2;

--number of rows present 
select count(*) from project..dataset1;
select count(*) from project..dataset2;

--data for jharkhand and bihar
select * from project..dataset1 where state in ('Jharkhand' , 'Bihar')

--population of india 
select sum(population) as population from project..dataset2

--average growth percentage of country
select avg(growth)*100 as average_growth from project..dataset1

--average growth percentage of state
select state, avg(growth)*100 as average_growth from project..dataset1 group by state;

--average sex ratio
select state, round(avg(Sex_Ratio),0) as average_sexratio from project..dataset1 group by state order by average_sexratio desc ;

--average literacy > 90 
select state, round(avg(Literacy),0) as average_literacy from project..dataset1 
group by state having round(avg(Literacy),0)>90 order by average_literacy desc  ;

--top three states showing highest growth ratio
select top 3 state, avg(growth)*100 as top_3_avg_growth from project..dataset1 
group by state order by top_3_avg_growth desc;

--bottom three states showing highest growth ratio
select  top 3 state, avg(growth)*100 as top_3_avg_growth from project..dataset1 
group by state order by top_3_avg_growth asc;

--top and bottom 3 states in literacy state
drop table if exists #topstates; --drops table and then from next line entire table is created again
create table #topstates
(state_ nvarchar(255),
top_states float)

insert into #topstates
select  state, round(avg(Literacy),0) as literacy_ratio from project..dataset1 
group by state order by literacy_ratio desc;

select* from #topstates order by #topstates.top_states desc;

--top and bottom 3 states in literacy state
drop table if exists #bottomstates;
create table #bottomstates
(state_ nvarchar(255),
bottom_states float)

insert into #bottomstates
select  state, round(avg(Literacy),0) as literacy_ratio from project..dataset1 
group by state order by literacy_ratio desc;

select* from #bottomstates order by #bottomstates.bottom_states asc;

--union operator
select* from(
select top 3 * from #topstates order by #topstates.top_states desc) a

union 

select* from(
select top 3 * from #bottomstates order by #bottomstates.bottom_states asc) b;

--states starting with letter a
select distinct state from project..dataset1 where lower(state) like
'a%' or lower(state) like 'b%';

select distinct state from project..dataset1 where lower(state) like
'a%' and lower(state) like '%m';

select distinct state from project..dataset1 where lower(state) like
'm%' and lower(state) like '%a';

--joining tables on the basis of district column
select A.district, A.state, A.sex_ratio, B.population from project..dataset1 A
inner join project..dataset2 B on A.district = B.district 
