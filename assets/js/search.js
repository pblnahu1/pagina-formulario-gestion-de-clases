
/* TODO: Mejorar código (pendiente) */


document.addEventListener('DOMContentLoaded', function () {
  const searchInput = document.getElementById('searchInput');
  console.log(searchInput);
  const searchButton = document.getElementById('searchButton');
  console.log(searchButton);
  const filterSelect = document.getElementById('filterSelect');
  console.log(filterSelect);
  const table = document.querySelector('.table_principal-body');
  console.log(table);
  const tableBody = table.querySelector('tbody');
  console.log(tableBody);

  function filterTable() {
    const searchValue = searchInput.value.toLowerCase();
    console.log(searchValue);
    const filterValue = filterSelect.value;
    console.log(filterValue);

    if (!tableBody) return;

    const rows = tableBody.getElementsByTagName('tr');
    for (let i = 0; i < rows.length; i++) {
      const cells = rows[i].getElementsByTagName('td');
      let rowContainsText = false;

      if (filterValue === "" || filterValue === "Por Materia") {
        for (let j = 1; j < cells.length; j++) {
          const cellText = cells[j].innerText || cells[j].textContent;
          if (cellText.toLowerCase().includes(searchValue)) {
            rowContainsText = true;
            break;
          }
        }
      } else {
        let columnIndex;
        switch (filterValue) {
          case "Por fecha":
            columnIndex = 5;
            break;
          case "Por hora":
            columnIndex = 4;
            break;
          default:
            columnIndex = -1;
        }

        if (columnIndex > -1 && columnIndex < cells.length) {
          const cellText = cells[columnIndex].innerText || cells[columnIndex].textContent;
          if (cellText.toLowerCase().includes(searchValue)) {
            rowContainsText = true;
          }
        }
      }

      rows[i].style.display = rowContainsText ? '' : 'none';
    }
  }

  searchButton.addEventListener('click', filterTable);
  filterSelect.addEventListener('change', filterTable);
  searchInput.addEventListener('keyup', filterTable);
});
