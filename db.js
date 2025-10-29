// 1. Importa a dependência do mysql
var mysql = require('mysql');

// 2. Elementos para conexao com mysql
var conexao = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'senha', // Deixe em branco se não tiver senha
  database: 'BD_PROTEGE_V6', // <-- MUDANÇA IMPORTANTE AQUI
  multipleStatements: true
});

// 3. Executar conexao com BD
conexao.connect(function(err) {
  if (err) {
    console.error('Erro ao conectar ao banco de dados: ' + err.stack);
    return;
  }
  console.log('Conexão bem-sucedida ao banco BD_PROTEGE_V6 (ID: ' + conexao.threadId + ')');
});

// 4. Exporta modulo globalmente
module.exports = conexao;
