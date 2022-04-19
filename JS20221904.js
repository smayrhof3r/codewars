/*So you are the only barista today, and you only have one coffee machine that can brew one coffee at a time.
People start giving you their orders.
Let's not think about the time you need to write down their orders, but you need 2 additional minutes to clean the coffee machine after each coffee you make.
Now you have a list coffees of the orders and you write down next to each of the orders the time you need to brew each one of those cups of coffee.

Task:
Given a list of the times you need to brew each coffee, return the minimum total waiting time.
If you get it right, you will get that raise your boss promised you!

Note that:
It is possible to receive no orders. (It's a free day :), maybe the next day your boss will start giving you some orders himself, you probably don't want that :) )
You can only brew one coffee at a time.
Since you have one coffee machine, you have to wait for it to brew the current coffee before you can move on to the next one.
Ignore the time you need to serve the coffee and the time you need to take the orders and write down the time you need to make each one of them.
If you have three customers with times [4,3,2], the first customer is going to wait 4 minutes for his coffee, the second customer is going to wait 4 minutes (the time needed for the first customer to get his coffee), another 2 minutes (the time needed to clean the machine) and 3 more minutes (the time you need to brew his coffee), so in total 9 minutes. The third customer, by the same logic, is about to wait 9 minutes (for the first two customers) + 2 more minutes(cleaning) + 2 minutes (his coffee brewing time). This order of brewing the coffee will end up in a total waiting time of 26 minutes, but note that this may not be the minimum time needed. This time depends on the order you choose to brew the cups of coffee.
The order in which you brew the coffee is totally up to you.

Examples:
coffees = [3,2,5,10,9]  ->  85
coffees = [20,5]        ->  32
coffees = [4,3,2]       ->  22*/

const waiting_time = (coffees) => {

  let total_wait = 0;

  /*as earlier coffees need to waited on by the most people, sort short to long*/
  coffees.sort((a,b) => {return a-b;});

  /*first coffee, everyone needs to wait for so muliply by (coffees.length).
  second coffee, everyone except first person needs to wait for (incl. clean time),
  multiply by (clean + coffee) * (coffees.length - 1), and so on...*/

  coffees.forEach((coffee, index) => {
    total_wait += (coffees.length - index) * (coffee + (index == 0 ? 0 : clean));
  });

  return total_wait;
}

const clean = 2;
typeof 2;


console.log(waiting_time([2,3,4]));
console.log(waiting_time([2,10,5,3,9]));
