const pay = () => {
  Payjp.setPublicKey("pk_test_テストコード"); 
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("number"),
      cvc: formData.get("pur[cvc]"),
      exp_month: formData.get("pur[exp-month]"),
      exp_year: `20${formData.get("pur[exp-year]")}`,
    };
console.log(card)
// debugger
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);

// console.log(card)