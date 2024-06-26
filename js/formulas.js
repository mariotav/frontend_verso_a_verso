const fisica = document.querySelector("#formsfisica");
fisica.addEventListener ("click", () => {
     fetch('http://localhost:3000/formulas') .then(response => { 
        // Verifica se a resposta é bem-sucedida 
        if (!response.ok) { throw new Error('Network response was not ok ' + response.statusText); } 
        return response.json();}) .then(data => {
            console.log(data)
        });
});