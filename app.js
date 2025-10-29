// 1. Importar as dependências
const express = require("express");
const app = express();

const mySql = require('./db.js'); // Importa o arquivo de conexão db.js
const port = 3000; // Define a porta
app.use(express.static('public'));
// 2. Configurar o EJS como view engine
app.set("view engine", "ejs");
app.set("views", "./views");  // Aponta para a pasta 'views'

// 3. Configurar o middleware para ler dados de formulário
app.use(express.urlencoded({ extended: false }));

// 4. Rota principal (READ / CONSULTAR) - Exigência da Avaliação
app.get("/", function (req, res) {

    // Consulta JOIN entre Enfermidade e Procedimentoclinico
    const sql = `
        SELECT
            e.IdEnfermidade,
            e.CID10,
            e.Descricao AS EnfermidadeDescricao,
            p.IdProcedimento,
            p.Descricao AS ProcedimentoDescricao
        FROM
            Enfermidade e
        JOIN
            Procedimentoclinico p ON e.IdEnfermidade = p.IdEnfermidade_FK
        ORDER BY
            e.Descricao
    `;

    mySql.query(sql, [], function (err, rows) {
        if (err) {
            console.error("Erro ao executar a consulta JOIN: " + err.message);
            return res.status(500).send("Erro ao buscar dados do banco.");
        }

        // Renderiza o arquivo 'index.ejs', passando os dados
        res.render("index.ejs", { dados: rows });
    });
});

// Rota GET para exibir o formulário de inserção
app.get("/inserir", function (req, res) {
    // Renderiza o arquivo 'inserir.ejs' (que vamos criar)
    // Passa um objeto 'dados' vazio para evitar erros no formulário
    res.render("inserir.ejs", { dados: {} });
});

// Rota POST para receber os dados do formulário e inserir no banco
app.post("/inserir", function (req, res) {

    // 1. Dados da Enfermidade (do formulário req.body)
    const sqlEnfermidade = "INSERT INTO Enfermidade (CID10, Descricao, Sintormas, Gravidade) VALUES (?, ?, ?, ?)";
    const dadosEnfermidade = [
        req.body.cid10,
        req.body.enfermidadeDescricao,
        req.body.sintomas,
        req.body.gravidade
    ];

    // Executa o INSERT na Enfermidade
    mySql.query(sqlEnfermidade, dadosEnfermidade, function (err, result) {
        if (err) {
            console.error("Erro ao inserir Enfermidade: " + err.message);
            return res.status(500).send("Erro ao salvar enfermidade.");
        }

        // Se o INSERT na Enfermidade deu certo:
        console.log("Enfermidade inserida com ID:", result.insertId);
        const novoIdEnfermidade = result.insertId; // Pega o ID gerado

        // 2. Dados do Procedimento (do formulário req.body)
        const sqlProcedimento = "INSERT INTO Procedimentoclinico (Descricao, IdEnfermidade_FK) VALUES (?, ?)";
        const dadosProcedimento = [
            req.body.procedimentoDescricao,
            novoIdEnfermidade // Usa o ID da Enfermidade como chave estrangeira
        ];

        // Executa o INSERT no Procedimentoclinico
        mySql.query(sqlProcedimento, dadosProcedimento, function (errProc) {
            if (errProc) {
                console.error("Erro ao inserir Procedimento: " + errProc.message);
                // Opcional: Aqui você poderia tentar deletar a Enfermidade que foi inserida
                return res.status(500).send("Erro ao salvar procedimento associado.");
            }

            console.log("Procedimento inserido com sucesso.");
            // 3. Redireciona de volta para a página principal após sucesso
            res.redirect("/");
        });
    });
});

// Rota GET para exibir o formulário de EDIÇÃO pré-preenchido
app.get("/editar/:id", function (req, res) {
    // Pega o IdProcedimento da URL (ex: /editar/15 -> id = 15)
    const idProcedimento = req.params.id;

    // Consulta SQL para buscar o procedimento e a enfermidade associada
    // Usamos JOIN para pegar dados das duas tabelas
    const sql = `
        SELECT
            e.IdEnfermidade,
            e.CID10,
            e.Descricao AS EnfermidadeDescricao,
            e.Sintormas,
            e.Gravidade,
            p.IdProcedimento,
            p.Descricao AS ProcedimentoDescricao,
            p.IdEnfermidade_FK
        FROM
            Procedimentoclinico p
        JOIN
            Enfermidade e ON p.IdEnfermidade_FK = e.IdEnfermidade
        WHERE
            p.IdProcedimento = ?
    `;

    mySql.query(sql, [idProcedimento], function (err, result) {
        if (err) {
            console.error("Erro ao buscar dados para edição: " + err.message);
            return res.status(500).send("Erro ao buscar dados do banco.");
        }

        // Verifica se encontrou um resultado
        if (result.length === 0) {
            return res.status(404).send("Registro não encontrado.");
        }

        // Renderiza o 'editar.ejs' (que vamos criar), passando os dados encontrados (result[0])
        res.render("editar.ejs", { dados: result[0] });
    });
});

// Rota POST para receber os dados do formulário de EDIÇÃO e atualizar o banco
app.post("/editar/:id", function (req, res) {
    // Pega o IdProcedimento da URL
    const idProcedimento = req.params.id;
    // Pega o IdEnfermidade que estava no campo oculto do formulário
    const idEnfermidade = req.body.idEnfermidade;

    // 1. Dados da Enfermidade atualizados (do formulário req.body)
    const sqlEnfermidade = `
        UPDATE Enfermidade
        SET CID10 = ?, Descricao = ?, Sintormas = ?, Gravidade = ?
        WHERE IdEnfermidade = ?
    `;
    const dadosEnfermidade = [
        req.body.cid10,
        req.body.enfermidadeDescricao,
        req.body.sintomas,
        req.body.gravidade,
        idEnfermidade // ID da enfermidade a ser atualizada
    ];

    // Executa o UPDATE na Enfermidade
    mySql.query(sqlEnfermidade, dadosEnfermidade, function (err) {
        if (err) {
            console.error("Erro ao atualizar Enfermidade: " + err.message);
            return res.status(500).send("Erro ao salvar alterações na enfermidade.");
        }

        // 2. Dados do Procedimento atualizados (do formulário req.body)
        const sqlProcedimento = `
            UPDATE Procedimentoclinico
            SET Descricao = ?
            WHERE IdProcedimento = ?
        `;
        const dadosProcedimento = [
            req.body.procedimentoDescricao,
            idProcedimento // ID do procedimento a ser atualizado
        ];

        // Executa o UPDATE no Procedimentoclinico
        mySql.query(sqlProcedimento, dadosProcedimento, function (errProc) {
            if (errProc) {
                console.error("Erro ao atualizar Procedimento: " + errProc.message);
                return res.status(500).send("Erro ao salvar alterações no procedimento.");
            }

            console.log("Registros (Enfermidade e Procedimento) atualizados com sucesso.");
            // 3. Redireciona de volta para a página principal após sucesso
            res.redirect("/");
        });
    });
});

// Rota GET para exibir a página de confirmação de EXCLUSÃO
app.get("/delete/:id", function (req, res) {
    // Pega o IdProcedimento da URL
    const idProcedimento = req.params.id;

    // Consulta SQL para buscar o procedimento e a enfermidade associada
    const sql = `
        SELECT
            e.IdEnfermidade,
            e.CID10,
            e.Descricao AS EnfermidadeDescricao,
            p.IdProcedimento,
            p.Descricao AS ProcedimentoDescricao
        FROM
            Procedimentoclinico p
        JOIN
            Enfermidade e ON p.IdEnfermidade_FK = e.IdEnfermidade
        WHERE
            p.IdProcedimento = ?
    `;

    mySql.query(sql, [idProcedimento], function (err, result) {
        if (err) {
            console.error("Erro ao buscar dados para exclusão: " + err.message);
            return res.status(500).send("Erro ao buscar dados do banco.");
        }

        // Verifica se encontrou um resultado
        if (result.length === 0) {
            return res.status(404).send("Registro não encontrado.");
        }

        // Renderiza o 'delete.ejs' (que vamos criar), passando os dados encontrados
        res.render("delete.ejs", { dados: result[0] });
    });
});
// Rota POST para executar a EXCLUSÃO no banco de dados
app.post("/delete/:id", function (req, res) {
    // Pega o IdProcedimento da URL
    const idProcedimento = req.params.id;

    // Comando SQL para deletar o registro específico da tabela Procedimentoclinico
    const sql = "DELETE FROM Procedimentoclinico WHERE IdProcedimento = ?";

    mySql.query(sql, [idProcedimento], function (err, result) {
        if (err) {
            console.error("Erro ao deletar Procedimento: " + err.message);
            return res.status(500).send("Erro ao excluir registro do banco.");
        }

        // Verifica se alguma linha foi afetada (se o ID existia)
        if (result.affectedRows === 0) {
            console.warn("Nenhum registro encontrado com o ID para deletar:", idProcedimento);
            return res.status(404).send("Registro não encontrado para exclusão.");
        }

        console.log("Procedimento deletado com sucesso. ID:", idProcedimento);
        // Redireciona de volta para a página principal após sucesso
        res.redirect("/");
    });
});

// Rota GET para LISTAR todas as Pessoas
app.get("/pessoas", function (req, res) {
    // Comando SQL para selecionar todas as pessoas, ordenadas pelo nome
    const sql = "SELECT * FROM Pessoa ORDER BY Nome";

    mySql.query(sql, [], function (err, rows) {
        if (err) {
            console.error("Erro ao buscar lista de Pessoas: " + err.message);
            return res.status(500).send("Erro ao buscar dados do banco.");
        }

        // Renderiza o arquivo 'pessoas.ejs' (que vamos criar), passando os dados encontrados
        res.render("pessoas.ejs", { dadosPessoas: rows }); // Usando 'dadosPessoas' como nome da variável
    });
});

// Rota GET para exibir o formulário de INSERÇÃO de Pessoa
app.get("/inserir-pessoa", function (req, res) {
    // Renderiza o arquivo 'inserir-pessoa.ejs' (que vamos criar)
    res.render("inserir-pessoa.ejs", { dados: {} }); // Passa objeto vazio
});

// Rota POST para INSERIR uma nova Pessoa no banco
app.post("/inserir-pessoa", function (req, res) {
    // Comando SQL para inserir
    const sql = "INSERT INTO Pessoa (CPF, Nome, Telefone, Cargo, Empresa, Email, Senha) VALUES (?, ?, ?, ?, ?, ?, ?)";
    // Dados vindos do formulário (req.body)
    const dadosPessoa = [
        req.body.cpf,
        req.body.nome,
        req.body.telefone,
        req.body.cargo,
        req.body.empresa,
        req.body.email,
        req.body.senha
    ];

    // Executa o INSERT
    mySql.query(sql, dadosPessoa, function (err, result) {
        if (err) {
            console.error("Erro ao inserir Pessoa: " + err.message);
            return res.status(500).send("Erro ao salvar pessoa.");
        }
        console.log("Pessoa inserida com ID:", result.insertId);
        // Redireciona de volta para a lista de pessoas após sucesso
        res.redirect("/pessoas");
    });
});

// Rota GET para exibir o formulário de EDIÇÃO de Pessoa pré-preenchido
app.get("/editar-pessoa/:id", function (req, res) {
    // Pega o IdPessoa da URL
    const idPessoa = req.params.id;

    // Comando SQL para buscar os dados da pessoa específica
    const sql = "SELECT * FROM Pessoa WHERE IdPessoa = ?";

    mySql.query(sql, [idPessoa], function (err, result) {
        if (err) {
            console.error("Erro ao buscar dados da Pessoa para edição: " + err.message);
            return res.status(500).send("Erro ao buscar dados do banco.");
        }

        // Verifica se encontrou um resultado
        if (result.length === 0) {
            return res.status(404).send("Pessoa não encontrada.");
        }

        // Renderiza o 'editar-pessoa.ejs' (que vamos criar), passando os dados encontrados
        res.render("editar-pessoa.ejs", { dados: result[0] });
    });
});

// Rota POST para EDITAR uma Pessoa existente no banco
app.post("/editar-pessoa/:id", function (req, res) {
    // Pega o IdPessoa da URL
    const idPessoa = req.params.id;

    // Dados atualizados vindos do formulário (req.body)
    const dadosPessoa = [
        req.body.cpf,
        req.body.nome,
        req.body.telefone,
        req.body.cargo,
        req.body.empresa,
        req.body.email,
        req.body.senha,
        idPessoa // ID da pessoa a ser atualizada (para a cláusula WHERE)
    ];

    // Verifica se a senha foi deixada em branco para não atualizá-la
    let sql;
    if (req.body.senha) {
        // Se uma nova senha foi digitada, atualiza tudo
        sql = "UPDATE Pessoa SET CPF=?, Nome=?, Telefone=?, Cargo=?, Empresa=?, Email=?, Senha=? WHERE IdPessoa = ?";
    } else {
        // Se a senha está em branco, atualiza tudo MENOS a senha
        sql = "UPDATE Pessoa SET CPF=?, Nome=?, Telefone=?, Cargo=?, Empresa=?, Email=? WHERE IdPessoa = ?";
        dadosPessoa.splice(6, 1); // Remove o item da senha (índice 6) do array
    }


    // Executa o UPDATE
    mySql.query(sql, dadosPessoa, function (err, result) {
        if (err) {
            console.error("Erro ao atualizar Pessoa: " + err.message);
            return res.status(500).send("Erro ao salvar alterações da pessoa.");
        }
        console.log("Pessoa atualizada com ID:", idPessoa);
        // Redireciona de volta para a lista de pessoas após sucesso
        res.redirect("/pessoas");
    });
});

// Rota GET para exibir a página de confirmação de EXCLUSÃO de Pessoa
app.get("/delete-pessoa/:id", function (req, res) {
    // Pega o IdPessoa da URL
    const idPessoa = req.params.id;

    // Comando SQL para buscar os dados da pessoa específica
    const sql = "SELECT * FROM Pessoa WHERE IdPessoa = ?";

    mySql.query(sql, [idPessoa], function (err, result) {
        if (err) {
            console.error("Erro ao buscar dados da Pessoa para exclusão: " + err.message);
            return res.status(500).send("Erro ao buscar dados do banco.");
        }

        // Verifica se encontrou um resultado
        if (result.length === 0) {
            return res.status(404).send("Pessoa não encontrada.");
        }

        // Renderiza o 'delete-pessoa.ejs' (que vamos criar), passando os dados encontrados
        res.render("delete-pessoa.ejs", { dados: result[0] });
    });
});

// Rota POST para EXCLUIR uma Pessoa do banco
app.post("/delete-pessoa/:id", function (req, res) {
    // Pega o IdPessoa da URL
    const idPessoa = req.params.id;

    // Comando SQL para deletar
    const sql = "DELETE FROM Pessoa WHERE IdPessoa = ?";

    // Executa o DELETE
    mySql.query(sql, [idPessoa], function (err, result) {
        if (err) {
            console.error("Erro ao deletar Pessoa: " + err.message);
            // Verifica se o erro é de chave estrangeira (se a pessoa está sendo usada em Questao_Questionario)
            if (err.code === 'ER_ROW_IS_REFERENCED_2') {
                 return res.status(400).send("Erro: Não é possível excluir esta pessoa pois ela está associada a um questionário.");
            }
            return res.status(500).send("Erro ao excluir pessoa do banco.");
        }

        // Verifica se alguma linha foi afetada
        if (result.affectedRows === 0) {
            console.warn("Nenhuma Pessoa encontrada com o ID para deletar:", idPessoa);
            return res.status(404).send("Pessoa não encontrada para exclusão.");
        }

        console.log("Pessoa deletada com sucesso. ID:", idPessoa);
        // Redireciona de volta para a lista de pessoas após sucesso
        res.redirect("/pessoas");
    });
});


// 5. Iniciar o servidor
app.listen(port, () => {
    console.log("Servidor iniciado na porta 3000. Acesse: http://localhost:" + port);
});