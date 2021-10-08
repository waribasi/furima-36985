window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const itemPrice = document.getElementById("item-price").value;
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(itemPrice / 10);
    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(itemPrice - addTaxDom.innerHTML);
 })
});

// 以下はメモ欄-----------------------------------------------------------
// const priceInput = document.getElementById("金額を入力する場所のid");
// console.log("OK");
// "item-price"/
// 数値同士なら計算結果は出力できた