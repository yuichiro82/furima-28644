const pay = () => {
  Payjp.setPublicKey("");
  const form = document.getElementById("charge-form") || document.createElement('inputs'); //DOMをいれる処理
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_address[number]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
      cvc: formData.get("order_address[cvc]"),
    }

    Payjp.createToken(card, (status,response) => {
      if (status == 200 ) {
        const token = response.id;
        console.log(token);
      }
    });
  });
};

window.addEventListener('load', pay);