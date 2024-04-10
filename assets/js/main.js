
import { fn_button_alta, fn_button_modificacion, fn_button_baja } from "./app.js"

const d = document

// Botones Alta, Baja y Modificación.
// Le agrego `$` a las constantes para indicar que estoy trabajando con el DOM.
d.addEventListener("DOMContentLoaded", () => {
  const $closeModal = document.querySelector(".modal__close")
  const $closeModal2 = document.querySelector(".modal2__close")
  const $closeModal3 = document.querySelector(".modal3__close")

  const $btnAlta = d.getElementById("id-btn-alta")
  const $btnModificar = d.getElementById("id-btn-modificar")
  const $btnBaja = document.getElementById("id-btn-baja")
  const CheckboxModifyDelete = document.querySelectorAll(".input-checkbox-register");
  
// inhabilitar o habilitar btn-baja:
var acumuladorBaja = 0;
var acumuladorModif = 0;
var array = [];

for (let i = 0; i < CheckboxModifyDelete.length; i++) {
  CheckboxModifyDelete[i].addEventListener("click", (e) => {
    $btnBaja.removeAttribute('disabled');
    $btnModificar.removeAttribute('disabled');

    if (CheckboxModifyDelete[i].checked) {
      acumuladorBaja++;
      acumuladorModif++;
      if(acumuladorBaja >= 1 && acumuladorModif == 1){
        array[i] = CheckboxModifyDelete[i].value;
        console.log('¡Checkbox seleccionado!' + array[i]);
      }
      else if(acumuladorBaja >= 1 && acumuladorModif != 1){
        $btnModificar.setAttribute('disabled', "true");
        array[i] = CheckboxModifyDelete[i].value;
        console.log('¡Checkbox seleccionado!' + array[i]);
      }
    } else {
      acumuladorBaja--;
      acumuladorModif--;
      array.splice(i, 1);     // elimino del array el valor del chechbox indicado.
      console.log('Checkbox no seleccionado.');
      console.log(acumuladorBaja);
      if (acumuladorBaja == 0  ) {
        $btnBaja.setAttribute('disabled', "true");
      }
      if (acumuladorModif == 0  ) {
        $btnModificar.setAttribute('disabled', "true");
      }
    }

    // Convertir array a JSON y enviarlo al servidor
    var arrayJSON = JSON.stringify(array);
    fetch('peticion_POST.php', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ arrayJSON: arrayJSON })
      })
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.text();
      })
      .then(data => {
        console.log(data); // Manejar la respuesta del servidor si es necesario
      })
      .catch(error => {
        console.error('There has been a problem with your fetch operation:', error);
      });
  });
}





  fn_button_alta($btnAlta, $closeModal);
  fn_button_modificacion($btnModificar,$closeModal3);
  fn_button_baja($btnBaja, $closeModal2);
} );






