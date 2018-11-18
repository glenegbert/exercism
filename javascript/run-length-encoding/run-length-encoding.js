const encode = (string) =>  {
  if (string === '') { return string };
  const a = string.split('');
  let acc = { compressed: [], count: 0, lastChar: '' };
  const reduced = a.reduce(compressor, acc);
  return reduced.compressed.join('');
};

const compressor = (a, char, i, arr) => {
  if (i === 0 || char === a.lastChar) {
    a.count += 1
   } else {
     updateCompressed(a)
     a.count = 1;
  }
  a.lastChar = char;
  if (i + 1 === (arr.length)) {
    updateCompressed(a);
  }
  return a;
};

const updateCompressed = (a) => {
  a.count > 1 ? a.compressed.push(a.count.toString() + a.lastChar) : a.compressed.push(a.lastChar);
};

const decode = (string) => string.replace(/(\d+)([a-zA-Z|\s])|(\w|\s)/g, decompress)

const decompress = (match, p1, p2) => {
  if (p1 && p2) { return p2.repeat(parseInt(p1)) }
  return match;
}

export { encode, decode };
