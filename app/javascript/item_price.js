const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
      cvc: formData.get("order[cvc]"),
    };
    
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      
      document.getElementById("charge-form").submit();
    });
  });
};


window.addEventListener("load", pay);

// window.addEventListener("load", () => {
//   const priceInput = document.getElementById("item-price");
//   priceInput.addEventListener("input", () => {
//     const inputValue = priceInput.value;
    
//     const addTaxDom = document.getElementById("add-tax-price");
//     addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  
//     const salesProfit = document.getElementById("profit");
//     salesProfit.innerHTML = Math.floor(priceInput.value - addTaxDom.innerHTML);
//   });
  
// });