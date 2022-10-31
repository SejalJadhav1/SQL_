--How many states had at least 1 senator not voted?
select votes1 , votes2 from my_table
where votes1 like '%Not Voting%' or votes2 like '%Not Voting%';


--How many states have both Democrat senators?
select democrat1  , democrat2  from my_table
where democrat1 like '%D%' and democrat2 like '%D%';


--How many states have both Republican and Democrat senators? 
select democrat1  , democrat2  from my_table
where democrat1 like '%D%' and democrat2 like '%R%' or democrat1 like '%R%' and democrat2 like '%D%' ;

select votes1, votes2 from my_table
where votes1 like '%yea%' and votes2 like '%yea%';


--What is the highest absolute difference in percentage between yea and nay senators among the different parties
select democrat1 , votes1 , democrat2 , votes2 from my_table
where democrat1 like '%D%' and democrat2 like '%D%' and votes1 like '%yea%' and votes2 like '%yea%' ;
-- there are 42 sneators of Democrat with yea

select democrat1 , votes1 , democrat2 , votes2 from my_table
where democrat1 like '%D%' and democrat2 like '%D%' and votes1 like '%Nay%' and votes2 like '%Nay%';
-- there are 0 sneators of Democrat with nay

select democrat1 , votes1 , democrat2 , votes2 from my_table
where democrat1 like '%R%' and democrat2 like '%R%' and votes1 like '%yea%' and votes2 like '%yea%';
-- there are 24 sneators of Republican with yea

select democrat1 , votes1 , democrat2 , votes2 from my_table
where democrat1 like '%R%' and democrat2 like '%R%' and votes1 like '%nay%' and votes2 like '%nay%';
-- there are 6 sneators of Republican with nay


-- What's the total number of Yea votes from all senators whose name starts with "B"?
select senetors1 , votes1 from my_table
where senetors1 like '%b%' and votes1 like '%yea%' ; 
-- 10
select senetors2 from my_table
where senetors2 like '%b%' and votes1 like '%yea%';
--0