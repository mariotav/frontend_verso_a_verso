const express = require('express');
const router = express.Router();
const db = require('../util/db');
const verificarToken = require('../util/VerificaToken'); 

/**
 * Executa uma consulta no banco de dados e envia uma resposta.
 * @param {string} sql - A consulta SQL a ser executada.
 * @param {Array} params - Os parâmetros para a consulta SQL.
 * @param {Object} res - O objeto de resposta do Express.
 * @param {string} erroMsg - Mensagem de erro para ser enviada em caso de falha.
 */

function executarConsulta(sql, params, res, erroMsg) {
  db.query(sql, params, (err, result) => {
    if (err) {
      res.status(500).json({ erro: erroMsg, detalhes: err });
    } else {
      res.status(200).json(result);
    }
  });
}

// Rota para buscar todas as tarefas
router.get('/', (req,res) => {
  executarConsulta('SELECT * FROM formula', [id,nome,disciplina_id], res, "Erro na consulta da formula");
});


// Rota para buscar uma tarefa específica
router.get("/:id", (req,res) => {
  const id = req.params.id;
  executarConsulta('SELECT * FROM formula WHERE id = ?', [id], res, "Erro na consulta do formula");
});


// Rota para criar uma nova tarefa
router.post('/', (req,res) => {
  const { id,nome,disciplinas_id} = req.body;
  executarConsulta('INSERT INTO formula (id, nome,disciplinas_id) VALUES (?, ?)', [id, nome,disciplinas_id], res, "Erro no cadastro de formula!");
});


// Rota para deletar uma tarefa
router.delete("/:id", (req,res) => {
  const id = req.params.id;
  executarConsulta('DELETE FROM formula WHERE id = ?', [id], res, 'Erro ao deletar o formula');
});


// Rota para atualizar uma tarefa
router.put('/', (req,res) => {
  const { id, disciplinas_id } = req.body;
  executarConsulta('UPDATE formula disciplinas_id = ? WHERE id = ?', [disciplinas_id,id], res, "Erro ao atualizar o formula");
});


module.exports = router;
