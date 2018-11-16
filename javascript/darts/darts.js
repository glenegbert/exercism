const solve = (x, y) => {
  const total = x + y;
  if (total > 20) {
    return 0;
  } else if (total >= 10) {
    return 1;
  } else if (total > 0) {
    return 5;
  } else if (total === 0) {
    return 10;
  }
  return null;
};

export { solve };
