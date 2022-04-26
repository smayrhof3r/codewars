function sortItOut(array){
  //Write your own code!
    let odds = [];
    let evens = [];

    array.forEach((element) => {
      element % 2 == 0 ? evens.push(element) : odds.push(element);
    })

    odds.sort((a, b) => { a - b });
    evens.sort((a, b) => { b - a });

    return [...odds, ...evens];
  }

console.log(sortItOut([10, 8, 6, 4, 1, 2, 3, 5, 7]));
