 const encode = (string) =>  {
  if (string === '') { return string };
  const a = string.split('');
  let acc = { compressed: '', count: 0, lastChar: '' };
  return a.reduce(compressor, acc).compressed;
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
  a.count > 1 ? a.compressed += (a.count.toString() + a.lastChar) : a.compressed += (a.lastChar);
};

const decode = (string) => string.replace(/(\d+)([a-zA-Z|\s])/g, decompress)

const decompress = (match, p1, p2) => p2.repeat(p1)

export { encode, decode };
