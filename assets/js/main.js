
import { fn_button_alta, fn_button_modificacion, fn_button_baja } from "./app.js"

const d = document

// Botones Alta, Baja y Modificación.
// Le agrego `$` a las constantes para indicar que estoy trabajando con el DOM.
d.addEventListener("DOMContentLoaded", () => {
  const $closeModal = document.querySelector(".modal__close")

  const $btnAlta = d.getElementById("id-btn-alta")
  const $btnModificar = d.getElementById("id-btn-modificar")
  const $btnBaja = d.getElementById("id-btn-baja")

  const $checkboxModifyDelete = d.querySelectorAll(".input-checkbox-register");

  fn_button_alta($btnAlta, $closeModal)
  fn_button_modificacion($btnModificar)
  fn_button_baja($btnBaja)
})

