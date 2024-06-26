const fisica = document.querySelector("#formsfisica");
const disciplinas = fisica.getAttribute("disciplinas");

console.log(fisica);
console.log(disciplinas);


fisica.addEventListener("click", () => {
    fetch(`http://localhost:3000/formulas/${disciplinas}`).then(response => {
         //Verifica se a resposta é bem-sucedida 
        if (!response.ok) { throw new Error('Network response was not ok ' + response.statusText); }
        console.log("sucesso");
        return response.json();
    }).then(data => {
        let ul = document.querySelector("#listaDisciplinas");
        data.forEach(element => {
            let li = document.createElement("li");
            li.classList.add("li-disciplina");
           //ul.appendChild(li);
       });
        console.log(data)
    });
});
