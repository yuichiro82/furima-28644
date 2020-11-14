function price () {
  const item_price = document.getElementById('item-price');
  item_price.addEventListener("keyup",(e) => {
    const Price = item_price.value
    const add_tax_price = document.getElementById("add-tax-price")
    const fee = Price * 0.1;
    add_tax_price.innerHTML = `${fee}`
    const profit = document.getElementById("profit")
    const sales_profit = Price - fee
    profit.innerHTML = `${sales_profit}`
  });

}

window.addEventListener("load", price)