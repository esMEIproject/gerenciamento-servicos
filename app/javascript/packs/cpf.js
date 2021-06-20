const cpf = document.querySelector("#cpf");
cpf.addEventListener("keyup", () => {
  let value = cpf.value.replace(/[^a-z0-9]/gi, "").replace(/^([\d]{3})([\d]{3})?([\d]{3})?([\d]{2})?/, "$1.$2.$3-$4");
  
  cpf.value = value;
});