function InputCell(value) {
  this.value = value;
  this.dependencies = []
  this.setValue = (value) => {
    this.value = value;
    this.dependencies.forEach((d) => d.callback(d))
    const deps = this.dependencies.map((d) => { return [d].concat(dependencyChain(d))})
    const combined = deps.sort().reduce((accum, objs, idx, sa) => {
      if (idx === 0) {
        return accum = objs
      } else {
        objs.forEach( (o, i) => { accum.splice(i + idx, 0, o) })
        return accum
      }
    },[])
    combined.forEach((d) => d.callback(d))
  }
}

function dependencyChain(dependency) {
  return dependency.dependencies.reduce((accum, d) => {
      if (d.dependencies.length === 0) {
        accum.push(d)
        return accum.flat()
      } else {
        accum.push(dependencyChain(d).flat())
        return accum.flat()
      }},[])
}


function ComputeCell(inputCells, f) {
  this.dependencies = []
  this.addCallback = (cbc) => this.dependencies.push(cbc)
  this.removeCallback = (cbc) => this.dependencies = this.dependencies.filter((cb)=> cbc !== cb)
  this.value = f(inputCells);
  this.callback = () => { let originalValue = this.value
                         this.value = f(inputCells);
                         if (originalValue !== this.value) {
                          this.dependencies.forEach((d) => d.callback(this))
                         }}
  inputCells.forEach((ic) => { ic.dependencies.push(this) })
}


function CallbackCell(fun) {
  this.dependencies = []
  this.callback = (cc) => {
    this.values.push(fun(cc));
  }
  this.values = [];
}


export { InputCell, ComputeCell, CallbackCell }
