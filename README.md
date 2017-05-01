# Online-Trading-Application

This Web application has been developed for customers,Traders,Stock Exchanges and clearance Corporation for selling and buying shares for securities.

## Roles in the Application:
* Investor
* Trader/Broker
* Exchange
* Clearing Corporation/Administrator

## Goal:

### Trade life cycle:

The application starts with placing an order from a **Investor** to buy and sell stocks for a security and the investor is registered with a particular Broker at the time of creating an account.

That particular **Trader/Broker** will recieve an order from the investor and puts it in the ordering system.

The order is then recieved by the **Exchange** electronically and I have written an algorithm to match the buy and sell orders on the Exchange for a trade to accomplish.

When a trade is completed it then goes to the **clearing coorporation** to clear and settle all the amount and security balances.

Use cases of an investor:
1. Sign up
2. Register with a Trader/Broker
3. Deposit amount in his account
4. Request to buy and sell shares 

Use cases of a Trader/Broker:
1. Process the request of selling/buying shares of investors
2. Putting the order in the ordering system and send the request to the Exchange.
3. Broker communicates the trades to the client either immediately or end of day.

Use Cases of Exchange:
1. Registering a Broker/Trader
2. Process all the requests received by Trader/Broker and finding suitable counter parties so that a trade can happen
3. Forwarding the processed request to the Clearing Corporation for settlement of shares and amount.
4. Sending a notification of the trade to the Broker/Trader

Use Cases of Clearing Corporation:
1. Clearing and Settlement of trades
2. Settlement of shares



