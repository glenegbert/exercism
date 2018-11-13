
const translateWord = word => word.replace(/(^thr|sch|th|ch|qu|[^aeiou]qu|^[^aeiouy])(\w+)/, '$2$1') + 'ay';

const translator = {
  translate: word => word.split(' ').map(translateWord).join(' '),
};

export default translator;
