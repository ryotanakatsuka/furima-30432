window.addEventListener('load', () => {
  const priceInput=document.getElementById("item-price");
  priceInput.addEventListener("input",()=>{
    const inputValue=priceInput.value;
    fee=Math.floor(inputValue*0.1);
    profit=Math.floor(inputValue*0.9);
    const addTax=document.getElementById("add-tax-price");
    addTax.innerHTML=fee
    const sailsProfit=document.getElementById("profit");
    sailsProfit.innerHTML=profit
  });
  
})