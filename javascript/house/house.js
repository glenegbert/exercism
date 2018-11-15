const verseParts = {
  1: ['lay in', 'house that Jack built.'],
  2: ['ate', 'malt'],
  3: ['killed', 'rat'],
  4: ['worried', 'cat'],
  5: ['tossed', 'dog'],
  6: ['milked', 'cow with the crumpled horn'],
  7: ['kissed', 'maiden all forlorn'],
  8: ['married', 'man all tattered and torn'],
  9: ['woke', 'priest all shaven and shorn'],
  10: ['kept', 'rooster that crowed in the morn'],
  11: ['belonged to', 'farmer sowing his corn'],
  12: ['', 'horse and the hound and the horn'],
};

const lastPart = (number) => {
  const a = [];
  let i;
  for (i = 1; i < number; i += 1) {
    a.unshift(`that ${verseParts[i].join(' the ')}`);
  }
  return a;
};

const firstPart = number => [`This is the ${verseParts[number][1]}`];

const verse = number => firstPart(number).concat(lastPart(number));

const verses = (start, end) => {
  if (start === end) { return verse(start); }
  return (verse(start)).concat([''].concat(verses(start + 1, end)));
};

export default { verse, verses };
