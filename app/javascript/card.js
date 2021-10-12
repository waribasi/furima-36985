const pay = () => {
  Payjp.setPublicKey(""); 
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("pur_shi_add[number]"),
      cvc: formData.get("pur_shi_add[cvc]"),
      exp_month: formData.get("pur_shi_add[exp_month]"),
      exp_year: `20${formData.get("pur_shi_add[exp_year]")}`,
    };
console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
   });
 };

window.addEventListener("load", pay);


// 以下はコメ欄ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー,
// console.log(card),
// debugger;