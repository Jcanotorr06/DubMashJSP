var myVar;

function load() {
  myVar = setTimeout(showPage, 1000);
}

function showPage() {
  document.getElementById("spinner").style.display="none"
  document.getElementById("spinner-container").classList.toggle('vh-100')
  document.getElementById("body").style.display = "block";
  response();
}

const response = () =>{
  const queryString = window.location.search;
  const params = new URLSearchParams(queryString);
  if(params.has('res')){
      const res = params.get('res');
      if(res === '0'){
          document.getElementById('btn-exito').click();
      }
      else if(res === '1'){
          document.getElementById('mensaje-fallo').innerHTML = "El usuario o email no está disponible";
          document.getElementById('btn-fallo').click();
      }else if(res === '3'){
          document.getElementById('mensaje-fallo-inicio').innerHTML = "Usuario o contraseña incorrectos";
          document.getElementById('btn-fallo-inicio').click();
      }else{
          document.getElementById('mensaje-fallo').innerHTML = "Ocurrió un error. Intente nuevamente";
          document.getElementById('btn-fallo').click();
      }
  }
}