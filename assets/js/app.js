
const d = document;
const $modal = d.querySelector(".modal"); // Variable global
const $modal2 = d.querySelector(".modal2"); // Variable global
const $modal3 = d.querySelector(".modal3"); // Variable global
const fondo_modal = document.querySelector(".modal__container");  
const inputs_modal = document.querySelectorAll(".inputs-form-alta");
const select_materia = document.querySelector(".inputs-form-mod_materia");
const op_materia = document.querySelectorAll(".op-materia");
const op_materia_hidden = document.querySelector(".op-materia hidden");
let htmlcodeOp1 = `
<option value="1" class="op-materia" >1.Análisis Matemático 1</option>
<option value="2"  class="op-materia" >2.Inglés 2</option>
<option value="3"  class="op-materia" >3.Prácticas Profesionalizantes 3</option> ` ;
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
    e.preventDefault();
    /*fetch('assets/templates/modal_alta.html')
      .then(response => response.text())
      .then(template => {
        console.log(template)
        $modal.classList.remove("modal--show")
      })
      .catch(err => console.error(err))
    */
      $modal.classList.remove("modal--show");
      const bad = document.querySelector(".bad"); 
      fondo_modal.style.borderColor="white";
      for (let i = 0; i < inputs_modal.length; i++) {
        inputs_modal[i].style.borderColor = "white";
      }      
      bad.style.display="none";
  })
}

export const fn_button_modificacion =(openModalModificacion, closeModalModificacion) => {
  openModalModificacion.addEventListener("click", (e) => {
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
    $modal3.classList.add("modal3--show");

      console.log(select_materia.value);
      let valor = parseInt(select_materia.value);
      switch(valor ){
        case 1: 
        select_materia.innerHTML=" ";
        select_materia.innerHTML+=`
        <option value="1" class="op-materia" >1.Análisis Matemático 1</option>
        <option value="2"  class="op-materia" >2.Inglés 2</option>
        <option value="3"  class="op-materia" >3.Prácticas Profesionalizantes 3</option> ` ;
        break;
        case 2: 
        select_materia.innerHTML=" ";
        select_materia.innerHTML+=`
        <option value="2"  class="op-materia" >2.Inglés 2</option>
        <option value="1" class="op-materia" >1.Análisis Matemático 1</option>
        <option value="3"  class="op-materia" >3.Prácticas Profesionalizantes 3</option> ` ;
        break;
        case 3: 
        select_materia.innerHTML=" ";
        select_materia.innerHTML+=`
        <option value="3"  class="op-materia" >3.Prácticas Profesionalizantes 3</option>
        <option value="1" class="op-materia" >1.Análisis Matemático 1</option>
        <option value="2"  class="op-materia" >2.Inglés 2</option> ` ;
        break;
      }

  });

  closeModalModificacion.addEventListener("click", (e) => {
      e.preventDefault();
      /*fetch('assets/templates/modal_alta.html')
        .then(response => response.text())
        .then(template => {
          console.log(template)
          $modal.classList.remove("modal--show")
        })
        .catch(err => console.error(err))
      */
        $modal3.classList.remove("modal3--show");
    });

  }

export const fn_button_baja = (openModalBaja, closeModalBaja) => {
  openModalBaja.addEventListener("click", (e) => {
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
    $modal2.classList.add("modal2--show")
  })


  closeModalBaja.addEventListener("click", (e) => {
    e.preventDefault();
    /*fetch('assets/templates/modal_alta.html')
      .then(response => response.text())
      .then(template => {
        console.log(template)
        $modal.classList.remove("modal--show")
      })
      .catch(err => console.error(err))
    */

      $modal2.classList.remove("modal2--show");
    
  })
}


// Si no marqué ningun input checkbox, el botón de modificar debe estar inhabilitado
// Si marqué varios input checkbox, el botón de modificar debe estar inhabilitado, ya que solo se puede modificar 1 solo a la vez
// Si marqué un input checkbox, el botón de modificar se habilita y se podrá visualizar un formulario con esos mismos datos para poder editarlos.
const checkbox_modificar = (btnCheckModificar) => { /* TODO: Code here */ }

// Si no marqué ningún input checkbox, el botón de dar de baja debe estar inhabilitado
// Si marqué uno o varios input checkbox, el botón de dar de baja se habilita y saldrá un mensaje de alerta el cual mostrará los registros que se quieran eliminar y un botón de 'confirmar baja'
const checkbox_baja = (btnCheckBaja) => { /* TODO: Code here */ }