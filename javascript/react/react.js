function InputCell(value) {
  this.value = value;
  this.dependencies = []
  this.setValue = (value) => {
    this.value = value;
//    this.dependencies.forEach((d) => d.callback(d))

   const deps = this.dependencies.map((d) => { return dependencyChain(d).flat()})


   //console.log(deps)
   const combined = deps.sort().reduce((accum, objs, idx) => {
      if (idx === 0) {
        return accum = objs
      } else {
        objs.forEach( (o, i) => { accum.splice(i + idx, 0, o) })
        return accum
      }
    },[])
    const callbacks = (callbacksChain(this.dependencies).filter((value, index, self) => self.indexOf(value) === index))
//    this.dependencies.forEach((d) => { d.callback(d) })

 //   console.log(combined.filter((value,index,self) => self.indexOf(value) === index))
    combined
     .filter((value, index, self) => self.indexOf(value) === index).forEach((d) => { d.callback(d) })
  console.log(callbacks)
    callbacks.forEach((cb) => cb.dependencies.forEach((d) => {if (d.lastValue !== d.value) {cb.callback(d)}}))
  }
}

 function dependencyChain(dependency) {
  return [dependency].concat(dependency.dependencies.reduce((accum, d) => {
      if (d.dependencies.length === 0) {
        accum.push(d)
        return accum.flat()
      } else {
        accum.push(dependencyChain(d).flat())
        return accum.flat()
      }},[]))
}

function callbacksChain(dependencies) {
  return dependencies.reduce((accum, d) => {
      if (d.dependencies.length === 0) {
        accum.push(d.callbacks)
        return accum.flat()
      } else {
        accum.push(callbacksChain(d.dependencies).flat())
        return accum.flat()
      }},[])
}


function ComputeCell(inputCells, f, name) {
  this.lastValue = null
  this.name = name
  this.dependencies = []
  this.callbacks = []
  this.addCallback = (cbc) => { this.callbacks.push(cbc)
                                cbc.addDependency(this) }
  this.removeCallback = (cbc) => this.callbacks = this.callbacks.filter((cb)=> cbc !== cb)
  this.value = f(inputCells);
  this.callback = () => {
                         this.lastValue = this.value
                         this.value = f(inputCells);
                         if (this.lastValue !== this.value) {
                          //this.dependencies.forEach((d) => d.callback(this))
                          // this.callbacks.forEach((cb) => cb.callback(this))
                         }}
  inputCells.forEach((ic) => { ic.dependencies.push(this) })
}


function CallbackCell(fun) {
  this.addDependency = (computeCell) => this.dependencies.push(computeCell)
  this.dependencies = []
  this.callback = (computeCell) => {
    this.values.push(fun(computeCell));
  }
  this.values = [];
}


export { InputCell, ComputeCell, CallbackCell }
