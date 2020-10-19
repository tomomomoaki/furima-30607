function sales_commission (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keyup',() => {
    const addTaxPrice = document.getElementById('add-tax-price');
    const addTaxPriceVal = itemPrice.value * 0.1;
    const Profit  = document.getElementById('profit');
    const ProfitVal = itemPrice.value - addTaxPriceVal;
    addTaxPrice.innerHTML = `${Math.floor(addTaxPriceVal)}`;
    Profit.innerHTML = `${Math.floor(ProfitVal)}`;
  });
};
setInterval(sales_commission,1000);