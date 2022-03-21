window.addEventListener('load', () => {
  const inputNumberOfPeople = document.getElementById("input-number-of-people");
  const materialQuantities = document.querySelectorAll(".material-quantity");
  let quantitiesBox = []
  materialQuantities.forEach( (materialQuantity) => {
    quantitiesBox.push(materialQuantity.innerHTML);
  });
  
  inputNumberOfPeople.addEventListener('input', () => {
    const numberOfPeople = Math.floor(inputNumberOfPeople.value);
    for( let i = 0; i <= materialQuantities.length - 1; i++ ) {
      materialQuantities[i].innerHTML = quantitiesBox[i] * numberOfPeople;
    };
  });
});