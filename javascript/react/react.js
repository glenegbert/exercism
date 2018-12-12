function dependencyChain(dependency) {
  return [dependency].concat(dependency.dependencies.reduce((accum, d) => {
    if (d.dependencies.length === 0) {
      accum.push(d);
      return accum.flat();
    }
    accum.push(dependencyChain(d).flat());
    return accum.flat();
  }, []));
}

function uniqueCombinedDependencies(baseDependencies) {
  return baseDependencies
    .map(d => dependencyChain(d))
    .sort()
    .reduce((accum, objs, idx) => {
      objs.forEach((o, i) => { accum.splice(i + idx, 0, o); });
      return accum;
    }, [])
    .filter((value, index, self) => self.indexOf(value) === index);
}

function fireCallback(computeCell) {
  computeCell.callback();
}

function fireCallbacks(callbackCell) {
  callbackCell.dependencies.forEach((d) => {
    if (d.lastValue !== d.value) {
      callbackCell.callback(d);
    }
  });
}


function uniqueCombinedCallbacks(dependencies) {
  return dependencies.reduce((accum, d) => {
    if (d.dependencies.length === 0) {
      accum.push(d.callbacks);
      return accum.flat();
    }
    accum.push(uniqueCombinedCallbacks(d.dependencies).flat());
    return accum.flat();
  }, []).filter((value, index, self) => self.indexOf(value) === index);
}

function InputCell(value) {
  this.value = value;
  this.dependencies = [];
  this.setValue = (value) => {
    this.value = value;
    uniqueCombinedDependencies(this.dependencies).forEach(fireCallback);
    uniqueCombinedCallbacks(this.dependencies).forEach(fireCallbacks);
  };
}

function ComputeCell(inputCells, f) {
  this.lastValue = null;
  this.dependencies = [];
  this.callbacks = [];
  this.addCallback = (cbc) => {
    this.callbacks.push(cbc);
    cbc.addDependency(this);
  };
  this.removeCallback = cbc => this.callbacks = this.callbacks.filter(cb => cbc !== cb);
  this.value = f(inputCells);
  this.callback = () => {
    this.lastValue = this.value;
    this.value = f(inputCells);
  };
  inputCells.forEach((ic) => { ic.dependencies.push(this); });
}

function CallbackCell(fun) {
  this.addDependency = computeCell => this.dependencies.push(computeCell);
  this.dependencies = [];
  this.callback = (computeCell) => {
    this.values.push(fun(computeCell));
  };
  this.values = [];
}

export { InputCell, ComputeCell, CallbackCell };
