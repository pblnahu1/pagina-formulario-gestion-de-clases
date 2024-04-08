
import { fn_button_alta, fn_button_modificacion, fn_button_baja } from "./app.js"

const d = document

// Botones Alta, Baja y Modificación.
// Le agrego `$` a las constantes para indicar que estoy trabajando con el DOM.
d.addEventListener("DOMContentLoaded", () => {
  const $closeModal = document.querySelector(".modal__close")
  const $closeModal2 = document.querySelector(".modal2__close")

  const $btnAlta = d.getElementById("id-btn-alta")
  const $btnModificar = d.getElementById("id-btn-modificar")
  const $btnBaja = document.getElementById("id-btn-baja")
  const CheckboxModifyDelete = document.querySelectorAll(".input-checkbox-register");
  
// inhabilitar o habilitar btn-baja:
var acumulador=0;
var array=[];

for (let i = 0; i < CheckboxModifyDelete.length;i++) {
  if(CheckboxModifyDelete[i].addEventListener("click",(e)=>{
    $btnBaja.removeAttribute('disabled');
    if(CheckboxModifyDelete[i].checked) {
      acumulador++;
      array[i]=CheckboxModifyDelete[i].value;
      console.log('¡Checkbox seleccionado!'+array[i]);
    }
      else if(!CheckboxModifyDelete[i].checked) {
        acumulador--;
        console.log('Checkbox no seleccionado.');
        console.log(acumulador);
        if(acumulador==0){
          $btnBaja.setAttribute('disabled', "true");
        }
      }
  }));
  
  
}



  fn_button_alta($btnAlta, $closeModal)
  fn_button_modificacion($btnModificar)
  fn_button_baja($btnBaja, $closeModal2)
} );






