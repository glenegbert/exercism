const reverseString =(s)=> {
  if (s.length > 0) {
    return reverseString(s.slice(1)) + s[0]
  } else {
    return '';
  }
}

export default reverseString
