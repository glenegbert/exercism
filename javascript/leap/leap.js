export const isLeap = (year)=> {
  return isDivisibleBy(4, year) &&
    (!isDivisibleBy(100, year) ||
      isDivisibleBy(400, year))

}

let isDivisibleBy = (divisor, year)=> {
  return year %  divisor === 0;
}
