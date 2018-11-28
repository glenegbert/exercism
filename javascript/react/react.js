function InputCell(value) {
  this.value = value;
  this.callbacks = [];
  this.setValue = (value) => {
    this.value = value;
    this.callbacks.forEach((cbc) => cbc.callback(this));
  }

}

function ComputeCell(inputCells, f) {
  this.callbacks = [];
  this.addCallback = (cbc) => this.callbacks.push(cbc)
  this.removeCallback = (cbc) => this.callbacks = this.callbacks.filter((cb)=> cbc !== cb)
  this.value = f(inputCells);
  inputCells.forEach((ic) => {
    ic.callbacks.push(new CallbackCell(()=>
                        { let originalValue = this.value
                          this.value = f(inputCells);
                          if (originalValue !== this.value) {
                            this.callbacks.forEach((cb)=> cb.callback(this));
                          }
                        })
                      )})
}


function CallbackCell(fun) {
  this.callback = (cc) => {
    this.values.push(fun(cc));
  }
  this.values = [];
}


export { InputCell, ComputeCell, CallbackCell }
