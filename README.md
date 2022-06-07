# yield.vote-analysis
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
This report analyses the information that was compiled from those mining activities. The main questions answered are:

*How did users interact with the platform?
*How did voters apply the Harberger Tax?
*What is a successful depositing strategy ?
*How did the new mechanism improve allocation efficiency?

### Description of the Data
[voice-data_ETH-52.csv](https://github.com/datadeo/market.vote_analysis/blob/main/voice-data_ETH_52.csv) ,
[voice-data_BSC-30.csv](https://github.com/datadeo/market.vote_analysis/blob/main/Vote-Data_BSC_30.csv)
***voiceCredits*** - the amount of voting power accumulated
***voterID*** - unique number for each finance.vot identity
Data for 52 Rounds on ETH Mainnet and 30 Rounds on BSC

[Marketwinner_ETH.csv](https://github.com/datadeo/market.vote_analysis/blob/main/Marketwinner_ETH.csv) ,
[Marketwinner_BSC.csv](https://github.com/datadeo/market.vote_analysis/blob/main/market_winner_bsc.csv)
***round*** - completed round
***winnerindex*** - top-voted coin in that round, coins are indexed according to their position in the voting table
Both datasets are for 30 rounds

[ID_per_wallet_ETH_30.xml](https://github.com/datadeo/market.vote_analysis/blob/main/ID_per_wallet_ETH_30.xml) ,
[ID_per_wallet_BSC_30.xml](https://github.com/datadeo/market.vote_analysis/blob/main/ID_per_wallet_BSC_30.xml)
***voterIds*** - the number of identities each wallet minted
***coin*** - winning coin
Snapshot taken after 30 rounds

[vote-data_ETH_52.csv](https://github.com/datadeo/market.vote_analysis/blob/main/vote-data_ETH_52.csv) ,
[vote-data_BSC_30.csv](https://github.com/datadeo/market.vote_analysis/blob/main/Vote-Data_BSC_30.csv)
***roundid*** - number of rounds
***voterID*** - unique number for each finance.vot identity
***choices*** - index of the coins that were picked in each vote, the index is similiar to winnerindex, each coin is indexed according to its position in the voting table
***weights*** - the combination that was picked to weight the respective votes, per default users have 100$V (voting power). The amount of $V spent is the square of the weights
***voiceCreditsused*** - the amout of voting power spent
***choicesmade*** - total number of choices made
***currentVoiceCredits*** - total of voting power user holds at moment of vote
Data for 52 Rounds on ETH Mainnet and 30 Rounds on BSC

### Methods Used
* Descriptive Statistics
* Data Cleaning, Eda, Data Wrangeling
* Data Visualization

### Technologies
* SQL
* Excel
* Pandas,jupyter


## Featured Notebooks/Analysis/Deliverables
* [Clean Datasets as CSV](https://github.com/Lizzl/market.vote_analysis)
* [SQL Queries](https://github.com/Lizzl/market.vote_analysis/blob/main/voting_markets_EDA.sql)
* [Report](https://cryptpad.fr/file/#/2/file/CEkavekX8koJowgJHwiLTWFA/)
* Dune Dashboard 


