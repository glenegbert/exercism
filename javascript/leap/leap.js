const isDivisibleBy = (divisor, year) => year % divisor === 0;

export const isLeap = year => isDivisibleBy(4, year)
 && (!isDivisibleBy(100, year)
   || isDivisibleBy(400, year));
