SELECT * FROM yield;

#how many wallets played
SELECT COUNT(DISTINCT newOwner)
FROM yield
WHERE NOT newOwner = '0x0000000000000000000000000000000000000000' ;

#how much total was deposited
SELECT SUM(depositSLP) 
FROM yield; 

#how much per pulse
SELECT Pulse, SUM(depositSLP) as total_SLP
FROM yield
GROUP BY Pulse
ORDER BY total_SLP DESC; 

#how much per slot
SELECT slotId, SUM(depositSLP) as total_SLP
FROM yield
GROUP BY slotId
ORDER BY total_SLP; 

#AVG deposit
SELECT AVG(depositSLP)
FROM yield
WHERE NOT depositSLP = '0';

#MAX deposit 
SELECT * FROM yield
WHERE depositSLP = (SELECT MAX(depositSLP) FROM yield); 

#Min deposit
SELECT * FROM yield
WHERE depositSLP = (SELECT MIN(depositSLP) FROM yield WHERE burnrateSLP != 0 ); 

SELECT * FROM yield
WHERE slotID = 13;

#how much total burnt? 
#check check this in the transactions tokens sent to 0xa874Fa6ccDcCB57d9397247e088575C4EF34EC66 (safe address)
#in and out animiated with this data https://etherscan.io/address/0xfe64d9a8fd6565b6842d6574871d929809424280#tokentxns

#AVG burn rate
SELECT AVG(burnrateSLP) 
FROM yield;

#MAX Burn rate
SELECT * FROM yield
WHERE burnrateSLP = (SELECT MAX(burnrateSLP) FROM yield); 

SELECT * FROM yield
WHERE slotID = 2;

#Min burn rate
SELECT * FROM yield
WHERE burnrateSLP = (SELECT MIN(burnrateSLP) FROM yield WHERE burnrateSLP != 0 ); 

SELECT * FROM yield
WHERE slotID = 3;


#Average rewards
SELECT AVG(rewardsFVTForSession) 
FROM yield;

SELECT * FROM yield
WHERE rewardsFVTForSession = (SELECT MAX(rewardsFVTForSession) FROM yield); 

select * FROM yield
where slotId = 5;

SELECT COUNT(*), pulse, pulse_quarter FROM yield
WHERE rewardsFVTForSession = (SELECT MIN(rewardsFVTForSession) FROM yield)
GROUP BY pulse, pulse_quarter; 

#How many newowners per slot?
CREATE view ownersPslot AS
SELECT slotID, count(newOwner) as owners FROM yield
GROUP by slotId
ORDER BY owners DESC;

SELECT * FROM ownersPslot;

SELECT AVG(owners) FROM ownersPslot;

#change in owner per pulse
SELECT pulse, count(newOwner) as owners FROM yield
GROUP by pulse
ORDER BY owners DESC;

#change in owner per quarter
SELECT pulse_quarter, count(newOwner) as owners FROM yield
GROUP by pulse_quarter
ORDER BY owners DESC;


#when withdrawals quarter?
SELECT pulse_quarter, COUNT(newOwner) AS withdrawals FROM yield
WHERE newOwner = '0x0000000000000000000000000000000000000000'
GROUP BY pulse_quarter
ORDER BY withdrawals DESC;

#when evictions ppulse
SELECT pulse, COUNT(newOwner) AS evictions FROM yield
WHERE eviction = 'TRUE' AND previousOwner != '0x0000000000000000000000000000000000000000'
GROUP BY pulse
ORDER BY pulse;


SELECT pulse, COUNT(newOwner) AS evictions FROM yield10
WHERE eviction = 'TRUE' AND previousOwner != '0x0000000000000000000000000000000000000000'
GROUP BY pulse
ORDER BY pulse;

#when withdrawals p pulse?
SELECT pulse, COUNT(newOwner) AS withdrawals FROM yield10
WHERE newOwner = '0x0000000000000000000000000000000000000000'
GROUP BY pulse
ORDER BY withdrawals DESC;


#when evictions p quarter
SELECT pulse_quarter, COUNT(newOwner) AS evictions FROM yield
WHERE eviction = 'TRUE' AND previousOwner != '0x0000000000000000000000000000000000000000'
GROUP BY pulse_quarter
ORDER BY evictions DESC;

#when withdrawals p quarter
SELECT pulse_quarter,  COUNT(DISTINCT previousOwner) as withdrawals FROM yield
WHERE eviction = 'False' AND previousOwner != '0x0000000000000000000000000000000000000000'
GROUP BY pulse_quarter
ORDER BY withdrawals DESC;



#how many evictions?
SELECT COUNT(eviction) FROM yield
WHERE eviction = 'TRUE' AND previousOwner != '0x0000000000000000000000000000000000000000';

#how many wallets got kicked out?
SELECT COUNT(DISTINCT previousOwner) FROM yield
WHERE eviction = 'TRUE' AND previousOwner != '0x0000000000000000000000000000000000000000';

#how many withdrew?
SELECT COUNT(eviction) FROM yield
WHERE eviction = 'FALSE' AND previousOwner != '0x0000000000000000000000000000000000000000';

#how many got withdrawals?
SELECT COUNT(DISTINCT previousOwner) FROM yield
WHERE eviction = 'False' AND previousOwner != '0x0000000000000000000000000000000000000000';

#other way of calculating this
SELECT COUNT(DISTINCT previousOwner) FROM yield
WHERE newOwner = '0x0000000000000000000000000000000000000000';

#how many wallets never got kicked out?
SELECT * FROM yield;


#How often did wallets get kicked out?
CREATE VIEW evictions_p_owner AS
SELECT COUNT(*) as evictions, previousOwner
FROM yield
WHERE eviction = 'True' AND previousOwner != '0x0000000000000000000000000000000000000000'
GROUP BY previousOwner
ORDER BY evictions DESC;


SELECT * FROM evictions_p_owner;

SELECT AVG(evictions)
from evictions_p_owner;

#How often withdrew
CREATE VIEW withdrawals_p_owner AS
SELECT COUNT(*) as withdrawals, previousOwner
FROM yield
WHERE newOwner = '0x0000000000000000000000000000000000000000'
GROUP BY previousOwner
ORDER BY withdrawals DESC;

SELECT * FROM withdrawals_p_owner;

SELECT AVG(withdrawals)
FROM withdrawals_p_owner;


#how many never got kicked out 
SELECT COUNT(*)
	FROM yield
	WHERE previousOwner NOT IN ( SELECT DISTINCT previousOwner FROM yield WHERE eviction = 'True' AND previousOwner != '0x0000000000000000000000000000000000000000');
    
#lowest burnrate not get evicted yet ---> 0.0023
SELECT MAX(burnrateSLP) as burnrate, slotID
FROM yield
GROUP BY slotID
ORDER BY burnrate;

SELECT * FROM yield
WHERE slotID = 42;

#lowest disposal amount not get evicted yet  --> 118 
SELECT MAX(depositSLP) as deposit, slotID
FROM yield
GROUP BY slotID
ORDER BY deposit;

SELECT pulse, AVG(burnrateSLP) AS AVG_Burn_Rate
FROM yield
GROUP BY pulse
ORDER BY pulse;

SELECT pulse, AVG(depositSLP) AS AVG_Deposit
FROM yield
GROUP BY pulse
ORDER BY pulse;

#total deposit per pulse
SELECT SUM(depositSLP) as depsoit, pulse FROM yield10
GROUP BY pulse;

#total depsoit per slot
SELECT SUM(depositSLP) as depsoit, slotId FROM yield10
GROUP BY slotId;

#get deposit withdrawal
DROP VIEW dep;
CREATE VIEW dep as
SELECT MAX(depositSLP) as deposit, slotID, pulse FROM yield10
GROUP BY slotID, pulse;

SELECT * FROM dep;

SELECT SUM(deposit), pulse FROM dep
GROUP BY pulse;


SELECT SUM(rewardsFVTForSession), previousOwner FROM yield10
GROUP BY previousOwner;

SELECT SUM(depositSLP), newOwner FROM yield10
GROUP BY newOwner;

SELECT SUM(burnrateSLP), newOwner FROM yield10
GROUP BY newOwner;

CREATE VIEW top10rewards as
SELECT SUM(rewardsFVTForSession) as rewards, previousOwner FROM yield10
GROUP BY previousOwner
ORDER BY rewards DESC
LIMIT 10;

CREATE VIEW top10depositer as
SELECT SUM(depositSLP) as deposits, newOwner FROM yield10
GROUP BY newOwner
ORDER BY deposits DESC
LIMIT 10;

CREATE VIEW top10burner as
SELECT SUM(burnrateSLP) as burnt, newOwner FROM yield10
GROUP BY newOwner
ORDER BY burnt DESC
LIMIT 10;

SELECT previousOwner
FROM top10rewards
WHERE previousOwner NOT IN 
	(SELECT newOwner
	FROM top10depositer)
    ;
    
    
SELECT previousOwner
FROM top10rewards
WHERE previousOwner NOT IN 
	(SELECT newOwner
	FROM top10burner)
    ;
    
SELECT COUNT(newOwner)
FROM top10depositer
WHERE newowner IN 
	(SELECT newOwner
	FROM top10burner)
    ;
    

#This wallet managed to be among the top 10 rewards receiver without being top10 depositer nor top10 burner
SELECT *
FROM yield10
WHERE newOwner = '0x6d359982D9A750AC7e9b2a5211B390C8021A7F5f' ;

SELECT *
FROM yield10
WHERE previousOwner = '0x6d359982D9A750AC7e9b2a5211B390C8021A7F5f' ;