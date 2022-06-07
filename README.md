# The Creation of Perma-Liquidity
## Creating a report on yield.vote , a new kind of liquidity mining dapp


### Project Intro/Objective
With the aim of building the foundation of a decentralised decision making and will upgrade the governance capabilities of the whole crypto space as a whole, [FactoryDAO](https://www.finance.vote) is developing future infrastructure for decentraized autnomous organizations DAOs. Over the past years plenty of these dApps have been launched and tested. The first building block of this new governnce architecture has been the voting markets. 

[Yield.vote](https://app.yield.vote/#/) offers a new kind of liquidity mining experience.
As a user you can provide liquidity and gain access to network emission by holding a protocol property.
Protocol property is a slot in a smart contract. Each slot receives a fixed amount of FVT token during a pulse of 200k blocks (around 2 weeks).
The slot is always on sale. Yield.vote uses ‘Harberger Taxes’ to broker ownership of these slots in an on-going manner.

Harberger Taxes are an economic paradigm proposed by Glen Weyl and Eric Posner that promotes property holders to self-assess the value of their property.
If a purchaser values the property higher than the current owner, they can take ownership of the property. In other words, every property is always on sale.It is a tax, because the owners pay a tax based on the declared valuation of their property, effectively designing their own tax regime with higher taxes protecting their property from sale.

Since September 2021, yield.vote has seen 32 participating wallets, depositing a total of over 53 000 SLPs (Sushi Liquidity Pool Tokens ).
This report analyses the information that was compiled from those mining activities. 
***The main questions answered are:***

* How did users interact with the platform?
* How did voters apply the Harberger Tax?
* What is a successful depositing strategy?
* How did the new mechanism improve allocation efficiency?


### Smart contract addresse
Find more info on the smart contract as well as an description of the events here [LiquidityFactory](https://etherscan.io/address/0xfe64d9A8Fd6565b6842d6574871D929809424280#code). 

Addresse:
0xfe64d9A8Fd6565b6842d6574871D929809424280

### Description of the Data
[yield-slots_data.csv](https://github.com/Lizzl/yield.vote-analysis/blob/main/yield-slots_data.csv)
Raw data, queried from the blockchain.
Please note that the data refers to the deposit of the new owner, except for rewardsFVTForSession, which is the reward paid out to the previous slot owner, who gets evicted. 

[yield-slots_data10.csv]([https://github.com/Lizzl/yield.vote-analysis/blob/main/yield-slots_data.csv](https://github.com/Lizzl/yield.vote-analysis/blob/main/yield-slots_data10.csv))
The datasets contains of the data for 10 Pulses from the Resident Pool. 

[yield-burnrate10.csv][https://github.com/Lizzl/yield.vote-analysis/blob/main/yield-burnrate10.csv]
Extra spreadsheet for burn rate converted into ETH. 


### Methods Used
* Descriptive Statistics
* Data Cleaning, EDA, Data Wrangeling
* Data Visualization

### Technologies
* SQL
* Excel
* Pandas,jupyter


## Featured Notebooks/Analysis/Deliverables
* [Clean Datasets as CSV](https://github.com/Lizzl/yield.vote-analysis))
* [jupyter notebook_data-getter](https://github.com/Lizzl/yield.vote-analysis/blob/main/Slots-Data_Getter.ipynb)
* [jupyter notebook_prep-data](https://github.com/Lizzl/yield.vote-analysis/blob/main/Prep-Yield-Data_CorrMatrix.ipynb)
* [SQL Queries](https://github.com/Lizzl/market.vote_analysis/blob/main/voting_markets_EDA.sql)
* [Report](https://github.com/Lizzl/yield.vote-analysis/blob/main/Yield_Report_V01.pdf)



