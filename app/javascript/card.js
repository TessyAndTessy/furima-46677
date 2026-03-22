const pay = () => {
  const form = document.getElementById("charge-form");
  if (!form) return;

  const payjp = Payjp('*****')// PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        console.log("PAY.JP error:", response.error);
      } else {
        const token = response.id;
        const tokenObj = `<input value="${token}" name="order_address[token]" type="hidden">`;
        form.insertAdjacentHTML("beforeend", tokenObj);

      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();

      form.submit();
      }
    });
  });
};

window.addEventListener("turbo:load", pay);