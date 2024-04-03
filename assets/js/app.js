
const d = document
const $modal = d.querySelector(".modal") // Variable global

export const fn_button_alta = (openModalAlta, closeModalAlta) => {
  openModalAlta.addEventListener("click", (e) => {
    e.preventDefault()
    /*fetch('assets/templates/modal_alta.html')
      .then(response => response.text())
      .then(template => {
        console.log(template)
        $modal.innerHTML = template
        $modal.classList.add("modal--show")
      })
      .catch(err => console.error(err))
    */
    $modal.classList.add("modal--show")
  })

  closeModalAlta.addEventListener("click", (e) => {
    e.preventDefault()
    /*fetch('assets/templates/modal_alta.html')
      .then(response => response.text())
      .then(template => {
        console.log(template)
        $modal.classList.remove("modal--show")
      })
      .catch(err => console.error(err))
    */
    $modal.classList.remove("modal--show")
  })
}

export const fn_button_modificacion = (btnModificar) => btnModificar.addEventListener("click", (e) => {
  e.preventDefault()
  alert("Hiciste click en Modificar")
})

export const fn_button_baja = (btnBaja) => btnBaja.addEventListener("click", (e) => {
  e.preventDefault()
  alert("Hiciste click en Baja")
})

// Si no marqué ningun input checkbox, el botón de modificar debe estar inhabilitado
// Si marqué varios input checkbox, el botón de modificar debe estar inhabilitado, ya que solo se puede modificar 1 solo a la vez
// Si marqué un input checkbox, el botón de modificar se habilita y se podrá visualizar un formulario con esos mismos datos para poder editarlos.
const checkbox_modificar = (btnCheckModificar) => { /* TODO: Code here */ }

// Si no marqué ningún input checkbox, el botón de dar de baja debe estar inhabilitado
// Si marqué uno o varios input checkbox, el botón de dar de baja se habilita y saldrá un mensaje de alerta el cual mostrará los registros que se quieran eliminar y un botón de 'confirmar baja'
const checkbox_baja = (btnCheckBaja) => { /* TODO: Code here */ }