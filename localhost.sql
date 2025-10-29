-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 28/10/2025 às 20:02
-- Versão do servidor: 10.11.13-MariaDB-0ubuntu0.24.04.1
-- Versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `BD_PROTEGE_V6`
--
CREATE DATABASE IF NOT EXISTS `BD_PROTEGE_V6` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `BD_PROTEGE_V6`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Caso_Clinico`
--

CREATE TABLE `Caso_Clinico` (
  `IdCaso` int(10) UNSIGNED NOT NULL,
  `Descricao` text DEFAULT NULL,
  `Tipo` varchar(20) DEFAULT NULL,
  `IdEnfermidade_FK` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Enfermidade`
--

CREATE TABLE `Enfermidade` (
  `IdEnfermidade` int(10) UNSIGNED NOT NULL,
  `CID10` varchar(4) DEFAULT NULL,
  `Descricao` varchar(200) DEFAULT NULL,
  `Sintormas` text DEFAULT NULL,
  `Gravidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `Enfermidade`
--

INSERT INTO `Enfermidade` (`IdEnfermidade`, `CID10`, `Descricao`, `Sintormas`, `Gravidade`) VALUES
(1, 'A01', 'Dor generalizada /múltipla', NULL, NULL),
(2, 'A02', 'Arrepios/ calafrios', NULL, NULL),
(3, 'A03', 'Febre', NULL, NULL),
(4, 'A04', 'Debilidade/cansaço geral/fadiga', NULL, NULL),
(5, 'A05', 'Sentir-se doente', NULL, NULL),
(6, 'A06', 'Desmaio/síncope', NULL, NULL),
(7, 'A07', 'Coma', NULL, NULL),
(8, 'A08', 'Inchaço', NULL, NULL),
(9, 'A09', 'Problemas de sudorese', NULL, NULL),
(10, 'A10', 'Sangramento/Hemorragia NE', NULL, NULL),
(11, 'A11', 'Dores torácicas NE', NULL, NULL),
(12, 'A13', 'Receio/Medo do tratamento', NULL, NULL),
(13, 'A16', 'Criança irritável', NULL, NULL),
(14, 'A18', 'Preocupação com aparência', NULL, NULL),
(15, 'A20', 'Pedido/discussão eutanásia', NULL, NULL),
(16, 'A21', 'Fator de risco de malignidade', NULL, NULL),
(17, 'A23', 'Fator de risco NE', NULL, NULL),
(18, 'A25', 'Medo de morrer/medo da morte', NULL, NULL),
(19, 'A26', 'Medo de câncer NE', NULL, NULL),
(20, 'A27', 'Medo de outra doença NE', NULL, NULL),
(21, 'A28', 'Limitação funcional/incapacidade NE', NULL, NULL),
(22, 'A29', 'Outros sinais/sintomas gerais', NULL, NULL),
(23, 'A70', 'Tuberculose', NULL, NULL),
(24, 'A71', 'Sarampo', NULL, NULL),
(25, 'A72', 'Varicela', NULL, NULL),
(26, 'A73', 'Malária', NULL, NULL),
(27, 'A74', 'Rubéola', NULL, NULL),
(28, 'A75', 'Mononucleose infecciosa', NULL, NULL),
(29, 'A76', 'Outro exantema viral', NULL, NULL),
(30, 'A77', 'Dengue e outras doenças virais NE', NULL, NULL),
(31, 'A78', 'Hanseníase e outras doenças infecciosas NE', NULL, NULL),
(32, 'A79', 'Carcinomatose (localização primária desconhecida)', NULL, NULL),
(33, 'A80', 'Lesão traumática/acidente NE', NULL, NULL),
(34, 'A81', 'Politraumatismos/ferimentos múltiplos', NULL, NULL),
(35, 'A82', 'Efeito secundário de lesão traumática', NULL, NULL),
(36, 'A84', 'Intoxicação por medicamento', NULL, NULL),
(37, 'A85', 'Efeito adverso de fármaco dose correta', NULL, NULL),
(38, 'A86', 'Efeito tóxico de substância não medicinal', NULL, NULL),
(39, 'A87', 'Complicações de tratamento médico', NULL, NULL),
(40, 'A88', 'Efeito adverso de fator físico', NULL, NULL),
(41, 'A89', 'Efeito da prótese', NULL, NULL),
(42, 'A90', 'Malformação congênita NE/múltiplas', NULL, NULL),
(43, 'A91', 'Investigação com resultado anormal NE', NULL, NULL),
(44, 'A92', 'Alergia/reação alérgica NE', NULL, NULL),
(45, 'A93', 'Recém-nascido prematuro', NULL, NULL),
(46, 'A94', 'Morbidade perinatal, outra', NULL, NULL),
(47, 'A95', 'Mortalidade perinatal', NULL, NULL),
(48, 'A96', 'Morte', NULL, NULL),
(49, 'A97', 'Sem doença', NULL, NULL),
(50, 'A98', 'Medicina preventiva/manutenção da saúde', NULL, NULL),
(51, 'A99', 'Outras doenças gerais NE', NULL, NULL),
(52, 'B02', 'Gânglio linfático aumentado/doloroso', NULL, NULL),
(53, 'B04', 'Sinais/sintomas sangue', NULL, NULL),
(54, 'B25', 'Medo de VIH/ HIV/SIDA/ AIDS', NULL, NULL),
(55, 'B26', 'Medo de câncer no sangue/linfático', NULL, NULL),
(56, 'B27', 'Medo de outras doenças do sangue /vasos linfáticos', NULL, NULL),
(57, 'B28', 'Limitação funcional/incapacidade', NULL, NULL),
(58, 'B29', 'Outros sinais/ sintomas do sangue/ sistema linfático/ baço NE', NULL, NULL),
(59, 'B70', 'Linfadenite aguda', NULL, NULL),
(60, 'B71', 'Linfadenite crônica NE', NULL, NULL),
(61, 'B72', 'Doença de Hodgkin/linfomas', NULL, NULL),
(62, 'B73', 'Leucemia', NULL, NULL),
(63, 'B74', 'Outra neoplasia maligna no sangue', NULL, NULL),
(64, 'B75', 'Neoplasia benigna NE', NULL, NULL),
(65, 'B76', 'Rotura traumática do baço', NULL, NULL),
(66, 'B77', 'Outras lesões traumáticas do sangue/linfa/baço', NULL, NULL),
(67, 'B78', 'Anemia hemolítica hereditária', NULL, NULL),
(68, 'B79', 'Outra malformação congênita do sangue/linfática', NULL, NULL),
(69, 'B80', 'Anemia por deficiência de ferro', NULL, NULL),
(70, 'B81', 'Anemia perniciosa/deficiência de folatos', NULL, NULL),
(71, 'B82', 'Outras anemias NE', NULL, NULL),
(72, 'B83', 'Púrpura/defeitos de coagulação', NULL, NULL),
(73, 'B84', 'Glóbulos brancos anormais', NULL, NULL),
(74, 'B87', 'Esplenomegalia', NULL, NULL),
(75, 'B90', 'Infecção por VIH/ HIV/SIDA/ AIDS', NULL, NULL),
(76, 'B99', 'Outra doença do sangue/linfáticos/baço', NULL, NULL),
(77, 'D01', 'Dor abdominal generalizada/cólicas', NULL, NULL),
(78, 'D02', 'Dores abdominais, epigástricas', NULL, NULL),
(79, 'D03', 'Azia/ Queimação', NULL, NULL),
(80, 'D04', 'Dor anal/retal', NULL, NULL),
(81, 'D05', 'Irritação perianal', NULL, NULL),
(82, 'D06', 'Outras dores abdominais localizadas', NULL, NULL),
(83, 'D07', 'Dispepsia/indigestão', NULL, NULL),
(84, 'D08', 'Flatulência /gases/eructações', NULL, NULL),
(85, 'D09', 'Náusea', NULL, NULL),
(86, 'D10', 'Vômito', NULL, NULL),
(87, 'D11', 'Diarreia', NULL, NULL),
(88, 'D12', 'Obstipação', NULL, NULL),
(89, 'D13', 'Icterícia', NULL, NULL),
(90, 'D14', 'Hematêmese/vômito sangue', NULL, NULL),
(91, 'D15', 'Melena', NULL, NULL),
(92, 'D16', 'Hemorragia retal', NULL, NULL),
(93, 'D17', 'Incontinência fecal', NULL, NULL),
(94, 'D18', 'Alterações nas fezes/mov. intestinais', NULL, NULL),
(95, 'D19', 'Sinais/sintomas dos dentes/gengivas', NULL, NULL),
(96, 'D20', 'Sinais/sintomas da boca/língua/lábios', NULL, NULL),
(97, 'D21', 'Problemas de deglutição', NULL, NULL),
(98, 'D23', 'Hepatomegalia', NULL, NULL),
(99, 'D24', 'Massa abdominal NE', NULL, NULL),
(100, 'D25', 'Distensão abdominal', NULL, NULL),
(101, 'D26', 'Medo de câncer no aparelho digestivo', NULL, NULL),
(102, 'D27', 'Medo de outras doenças aparelho digestivo', NULL, NULL),
(103, 'D28', 'Limitação funcional/incapacidade', NULL, NULL),
(104, 'D29', 'Outros sinais/sintomas digestivos', NULL, NULL),
(105, 'D70', 'Infecção gastrointestinal', NULL, NULL),
(106, 'D71', 'Caxumba/parotidite epidêmica', NULL, NULL),
(107, 'D72', 'Hepatite viral', NULL, NULL),
(108, 'D73', 'Gastroenterite, presumível infecção', NULL, NULL),
(109, 'D74', 'Neoplasia maligna do estômago', NULL, NULL),
(110, 'D75', 'Neoplasia maligna do cólon/reto', NULL, NULL),
(111, 'D76', 'Neoplasia maligna do pâncreas', NULL, NULL),
(112, 'D77', 'Neoplasia maligna do aparelho digestivo NE', NULL, NULL),
(113, 'D78', 'Neoplasia benigna do aparelho digestivo/incerta', NULL, NULL),
(114, 'D79', 'Corpo estranho no aparelho digestivo', NULL, NULL),
(115, 'D80', 'Outras lesões traumáticas', NULL, NULL),
(116, 'D81', 'Malformações congênitas do aparelho digestivo', NULL, NULL),
(117, 'D82', 'Doença dos dentes/gengivas', NULL, NULL),
(118, 'D83', 'Doença da boca/língua/lábios', NULL, NULL),
(119, 'D84', 'Doença do esôfago', NULL, NULL),
(120, 'D85', 'Úlcera do duodeno', NULL, NULL),
(121, 'D86', 'Úlcera péptica, outra', NULL, NULL),
(122, 'D87', 'Alterações funcionais estômago', NULL, NULL),
(123, 'D88', 'Apendicite', NULL, NULL),
(124, 'D89', 'Hérnia inguinal', NULL, NULL),
(125, 'D90', 'Hérnia de hiato /diafragmática', NULL, NULL),
(126, 'D91', 'Hérnia abdominal, outras', NULL, NULL),
(127, 'D92', 'Doença diverticular intestinal', NULL, NULL),
(128, 'D93', 'Síndrome do cólon irritável', NULL, NULL),
(129, 'D94', 'Enterite crônica / colite ulcerosa', NULL, NULL),
(130, 'D95', 'Fissura anal / abcesso perianal', NULL, NULL),
(131, 'D96', 'Lombrigas /outros parasitas', NULL, NULL),
(132, 'D97', 'Doenças do fígado /NE', NULL, NULL),
(133, 'D98', 'Colecistite, colelitíase', NULL, NULL),
(134, 'D99', 'Outra doença do aparelho digestivo', NULL, NULL),
(135, 'F01', 'Dor no olho', NULL, NULL),
(136, 'F02', 'Olho vermelho', NULL, NULL),
(137, 'F03', 'Secreção ocular', NULL, NULL),
(138, 'F04', 'Moscas volantes/pontos luminosos/escotomas/ manchas', NULL, NULL),
(139, 'F05', 'Outras perturbações visuais', NULL, NULL),
(140, 'F13', 'Sensações oculares anormais', NULL, NULL),
(141, 'F14', 'Movimentos oculares anormais', NULL, NULL),
(142, 'F15', 'Aparência anormal nos olhos', NULL, NULL),
(143, 'F16', 'Sinais/sintomas das pálpebras', NULL, NULL),
(144, 'F17', 'Sinais/sintomas relacionados a óculos', NULL, NULL),
(145, 'F18', 'Sinais/sintomas relacionados a lentes de contato', NULL, NULL),
(146, 'F27', 'Medo de doença ocular', NULL, NULL),
(147, 'F28', 'Limitação funcional/incapacidade', NULL, NULL),
(148, 'F29', 'Outros sinais/sintomas oculares', NULL, NULL),
(149, 'F70', 'Conjuntivite infecciosa', NULL, NULL),
(150, 'F71', 'Conjuntivite alérgica', NULL, NULL),
(151, 'F72', 'Blefarite/hordéolo/calázio', NULL, NULL),
(152, 'F73', 'Outras infecções/inflamações oculares', NULL, NULL),
(153, 'F74', 'Neoplasia do olho/anexos', NULL, NULL),
(154, 'F75', 'Contusão/hemorragia ocular', NULL, NULL),
(155, 'F76', 'Corpo estranho ocular', NULL, NULL),
(156, 'F79', 'Outras lesões traumáticas oculares', NULL, NULL),
(157, 'F80', 'Obstrução canal lacrimal da criança', NULL, NULL),
(158, 'F81', 'Outras malformações congênitas do olho', NULL, NULL),
(159, 'F82', 'Descolamento da retina', NULL, NULL),
(160, 'F83', 'Retinopatia', NULL, NULL),
(161, 'F84', 'Degeneração macular', NULL, NULL),
(162, 'F85', 'Úlcera da córnea', NULL, NULL),
(163, 'F86', 'Tracoma', NULL, NULL),
(164, 'F91', 'Erro de refração', NULL, NULL),
(165, 'F92', 'Catarata', NULL, NULL),
(166, 'F93', 'Glaucoma', NULL, NULL),
(167, 'F94', 'Cegueira', NULL, NULL),
(168, 'F95', 'Estrabismo', NULL, NULL),
(169, 'F99', 'Outra doenças oculares/anexos', NULL, NULL),
(170, 'H01', 'Dor de ouvidos', NULL, NULL),
(171, 'H02', 'Problemas de audição', NULL, NULL),
(172, 'H03', 'Acufeno, zumbidos, ruído, assobios', NULL, NULL),
(173, 'H04', 'Secreção no ouvido', NULL, NULL),
(174, 'H05', 'Hemorragia no ouvido', NULL, NULL),
(175, 'H13', 'Sensação de ouvido tapado', NULL, NULL),
(176, 'H15', 'Preocupação com a aparência das orelhas', NULL, NULL),
(177, 'H27', 'Medo de doença do ouvido', NULL, NULL),
(178, 'H28', 'Limitação funcional/incapacidade', NULL, NULL),
(179, 'H29', 'Outros sinais/sintomas ouvido', NULL, NULL),
(180, 'H70', 'Otite externa', NULL, NULL),
(181, 'H71', 'Otite média aguda/miringite', NULL, NULL),
(182, 'H72', 'Otite média serosa', NULL, NULL),
(183, 'H73', 'Infecção da Trompa de Eustáquio', NULL, NULL),
(184, 'H74', 'Otite média crônica', NULL, NULL),
(185, 'H75', 'Neoplasia do ouvido', NULL, NULL),
(186, 'H76', 'Corpo estranho do ouvido', NULL, NULL),
(187, 'H77', 'Perfuração do tímpano', NULL, NULL),
(188, 'H78', 'Fibrilação/flutter auricular/atrial', NULL, NULL),
(189, 'H79', 'Outros traumatismos do ouvido', NULL, NULL),
(190, 'H80', 'Malformações congênitas do ouvido', NULL, NULL),
(191, 'H81', 'Cerúmen no ouvido em excesso', NULL, NULL),
(192, 'H82', 'Síndrome vertiginosa', NULL, NULL),
(193, 'H83', 'Otoesclerose', NULL, NULL),
(194, 'H84', 'Presbiacusia', NULL, NULL),
(195, 'H85', 'Lesão acústica', NULL, NULL),
(196, 'H86', 'Surdez', NULL, NULL),
(197, 'H99', 'Outra doença do ouvido/mastóide', NULL, NULL),
(198, 'K01', 'Dor atribuída ao coração', NULL, NULL),
(199, 'K02', 'Sensação de pressão/aperto atribuída ao coração', NULL, NULL),
(200, 'K03', 'Dores atribuídas ao aparelho circulatório NE', NULL, NULL),
(201, 'K04', 'Palpitações/percepção dos batimentos cardíacos', NULL, NULL),
(202, 'K05', 'Outras irregularidades dos batimentos cardíacos', NULL, NULL),
(203, 'K06', 'Veias proeminentes', NULL, NULL),
(204, 'K07', 'Tornozelos inchados/edema', NULL, NULL),
(205, 'K22', 'Fator de risco para doença cardiovascular', NULL, NULL),
(206, 'K24', 'Medo de doença cardíaca', NULL, NULL),
(207, 'K25', 'Medo de hipertensão', NULL, NULL),
(208, 'K27', 'Medo de outra doença cardiovascular', NULL, NULL),
(209, 'K28', 'Limitação funcional/incapacidade', NULL, NULL),
(210, 'K29', 'Outros sinais/sintomas cardiovasculares', NULL, NULL),
(211, 'K70', 'Doença infecciosa do aparelho circulatório', NULL, NULL),
(212, 'K71', 'Febre reumática/cardiopatia', NULL, NULL),
(213, 'K72', 'Neoplasia do aparelho circulatório', NULL, NULL),
(214, 'K73', 'Malformações congênitas do aparelho circulatório', NULL, NULL),
(215, 'K74', 'Doença cardíaca isquêmica com angina', NULL, NULL),
(216, 'K75', 'Infarto ou Enfarte agudo miocárdio', NULL, NULL),
(217, 'K76', 'Doença cardíaca isquêmica sem angina', NULL, NULL),
(218, 'K77', 'Insuficiência cardíaca', NULL, NULL),
(219, 'K78', 'Fibrilação/flutter auricular/atrial', NULL, NULL),
(220, 'K79', 'Taquicardia Paroxística', NULL, NULL),
(221, 'K80', 'Arritmia cardíaca NE', NULL, NULL),
(222, 'K81', 'Sopro cardíaco/arterial NE', NULL, NULL),
(223, 'K82', 'Doença cardiopulmonar', NULL, NULL),
(224, 'K83', 'Doença valvular cardíaca NE', NULL, NULL),
(225, 'K84', 'Outras doenças cardíacas', NULL, NULL),
(226, 'K85', 'Pressão arterial elevada', NULL, NULL),
(227, 'K86', 'Hipertensão sem complicações', NULL, NULL),
(228, 'K87', 'Hipertensão com complicações', NULL, NULL),
(229, 'K88', 'Hipotensão postural', NULL, NULL),
(230, 'K89', 'Isquemia/acidente cerebral transitória(o)', NULL, NULL),
(231, 'K90', 'Trombose/acidente vascular cerebral', NULL, NULL),
(232, 'K91', 'Doença vascular cerebral', NULL, NULL),
(233, 'K92', 'Aterosclerose/doença vascular periférica', NULL, NULL),
(234, 'K93', 'Embolia pulmonar', NULL, NULL),
(235, 'K94', 'Flebite/tromboflebite', NULL, NULL),
(236, 'K95', 'Veias varicosas da perna', NULL, NULL),
(237, 'K96', 'Hemorróidas', NULL, NULL),
(238, 'K99', 'Outras doenças do aparelho circulatório', NULL, NULL),
(239, 'L01', 'Sinais/sintomas do pescoço', NULL, NULL),
(240, 'L02', 'Sinais/sintomas da região dorsal', NULL, NULL),
(241, 'L03', 'Sinais/sintomas da região lombar', NULL, NULL),
(242, 'L04', 'Sinais/sintomas do tórax', NULL, NULL),
(243, 'L05', 'Sinais/sintomas da axila', NULL, NULL),
(244, 'L07', 'Sinais/sintomas da mandíbula', NULL, NULL),
(245, 'L08', 'Sinais/sintomas dos ombros', NULL, NULL),
(246, 'L09', 'Sinais/sintomas dos braços', NULL, NULL),
(247, 'L10', 'Sinais/sintomas dos cotovelos', NULL, NULL),
(248, 'L11', 'Sinais/sintomas dos punhos', NULL, NULL),
(249, 'L12', 'Sinais/sintomas das mãos e dedos', NULL, NULL),
(250, 'L13', 'Sinais/sintomas do quadril', NULL, NULL),
(251, 'L14', 'Sinais/sintomas da coxa/perna', NULL, NULL),
(252, 'L15', 'Sinais/sintomas do joelho', NULL, NULL),
(253, 'L16', 'Sinais/sintomas do tornozelo', NULL, NULL),
(254, 'L17', 'Sinais/sintomas do pé/dedos pé', NULL, NULL),
(255, 'L18', 'Dores musculares', NULL, NULL),
(256, 'L19', 'Sinais/sintomas musculares NE', NULL, NULL),
(257, 'L20', 'Sinais/sintomas das articulações NE', NULL, NULL),
(258, 'L26', 'Medo de câncer no aparelho músculo-esquelético', NULL, NULL),
(259, 'L27', 'Medo de doença no aparelho músculo-esquelético, outro', NULL, NULL),
(260, 'L28', 'Limitação funcional/incapacidade', NULL, NULL),
(261, 'L29', 'Outros sinais/sintomas do aparelho músculo-esquelético', NULL, NULL),
(262, 'L70', 'Infecções do aparelho músculo-esquelético', NULL, NULL),
(263, 'L71', 'Neoplasia maligna do aparelho músculo-esquelético', NULL, NULL),
(264, 'L72', 'Fratura: rádio/cúbito', NULL, NULL),
(265, 'L73', 'Fratura: tíbia/perônio/fíbula', NULL, NULL),
(266, 'L74', 'Fratura: osso da mão/pé', NULL, NULL),
(267, 'L75', 'Fratura: fêmur', NULL, NULL),
(268, 'L76', 'Outras fraturas', NULL, NULL),
(269, 'L77', 'Entorses e distensões do tornozelo', NULL, NULL),
(270, 'L78', 'Entorses e distensões do joelho', NULL, NULL),
(271, 'L79', 'Entorses e distensões das articulações NE', NULL, NULL),
(272, 'L80', 'Luxação/subluxação', NULL, NULL),
(273, 'L81', 'Traumatismos do aparelho musculoesquelético NE', NULL, NULL),
(274, 'L82', 'Malformações congênitas do aparelho músculo-esquelético', NULL, NULL),
(275, 'L83', 'Doenças ou síndromes da coluna cervical', NULL, NULL),
(276, 'L84', 'Doenças ou síndromes da coluna sem irradiação de dor', NULL, NULL),
(277, 'L85', 'Deformação adquirida da coluna', NULL, NULL),
(278, 'L86', 'Síndrome vertebral com irradiação dor', NULL, NULL),
(279, 'L87', 'Bursite/tendinite/sinovite NE', NULL, NULL),
(280, 'L88', 'Artrite reumatóide/soropositiva', NULL, NULL),
(281, 'L89', 'Osteoartrose do quadril', NULL, NULL),
(282, 'L90', 'Osteoartrose do joelho', NULL, NULL),
(283, 'L91', 'Outras osteoartroses', NULL, NULL),
(284, 'L92', 'Síndrome do ombro doloroso', NULL, NULL),
(285, 'L93', 'Cotovelo de tenista', NULL, NULL),
(286, 'L94', 'Osteocondrose', NULL, NULL),
(287, 'L95', 'Osteoporose', NULL, NULL),
(288, 'L96', 'Lesão interna aguda do joelho', NULL, NULL),
(289, 'L97', 'Neoplasia benigna/incertas', NULL, NULL),
(290, 'L98', 'Malformação adquirida de um membro', NULL, NULL),
(291, 'L99', 'Outra doença do aparelho músculo-esquelético', NULL, NULL),
(292, 'N01', 'Cefaléia', NULL, NULL),
(293, 'N03', 'Dores da face', NULL, NULL),
(294, 'N04', 'Síndrome das pernas inquietas', NULL, NULL),
(295, 'N05', 'Formigamento/parestesia nos dedos das mãos/pés', NULL, NULL),
(296, 'N06', 'Outras alterações da sensibilidade', NULL, NULL),
(297, 'N07', 'Convulsões/ataques', NULL, NULL),
(298, 'N08', 'Movimentos involuntários anormais', NULL, NULL),
(299, 'N16', 'Alterações do olfato/gosto', NULL, NULL),
(300, 'N17', 'Vertigens/tonturas', NULL, NULL),
(301, 'N18', 'Paralisia/fraqueza', NULL, NULL),
(302, 'N19', 'Perturbações da fala', NULL, NULL),
(303, 'N26', 'Medo de câncer do sistema neurológico', NULL, NULL),
(304, 'N27', 'Medo de outras doenças neurológicas', NULL, NULL),
(305, 'N28', 'Limitação funcional/incapacidade', NULL, NULL),
(306, 'N29', 'Sinais/sintomas do sistema neurológico, outros', NULL, NULL),
(307, 'N70', 'Poliomielite', NULL, NULL),
(308, 'N71', 'Meningite/encefalite', NULL, NULL),
(309, 'N72', 'Tétano', NULL, NULL),
(310, 'N73', 'Outra infecção neurológica', NULL, NULL),
(311, 'N74', 'Neoplasia maligna do sistema neurológico', NULL, NULL),
(312, 'N75', 'Neoplasia benigna do sistema neurológico', NULL, NULL),
(313, 'N76', 'Neoplasia do sistema neurológico de natureza incerta', NULL, NULL),
(314, 'N79', 'Concussão', NULL, NULL),
(315, 'N80', 'Outras lesões cranianas', NULL, NULL),
(316, 'N81', 'Outra lesão do sistema neurológico', NULL, NULL),
(317, 'N85', 'Malformações congênitas', NULL, NULL),
(318, 'N86', 'Esclerose múltipla', NULL, NULL),
(319, 'N87', 'Parkinsonismo', NULL, NULL),
(320, 'N88', 'Epilepsia', NULL, NULL),
(321, 'N89', 'Enxaqueca', NULL, NULL),
(322, 'N90', 'Cefaléia de cluster', NULL, NULL),
(323, 'N91', 'Paralisia facial/paralisia de Bell', NULL, NULL),
(324, 'N92', 'Nevralgia do trigêmeo', NULL, NULL),
(325, 'N93', 'Síndrome do túnel do carpo/Síndrome do canal cárpico', NULL, NULL),
(326, 'N94', 'Neurite/Nevrite/neuropatia periférica', NULL, NULL),
(327, 'N95', 'Cefaléia tensional', NULL, NULL),
(328, 'N99', 'Outras doenças do sistema neurológico', NULL, NULL),
(329, 'P01', 'Sensação de ansiedade/nervosismo/tensão', NULL, NULL),
(330, 'P02', 'Reação aguda ao estresse', NULL, NULL),
(331, 'P03', 'Tristeza/Sensação de depressão', NULL, NULL),
(332, 'P04', 'Sentir/comportar-se de forma irritável/zangada', NULL, NULL),
(333, 'P05', 'Sensação/comportamento senil', NULL, NULL),
(334, 'P06', 'Perturbação do sono', NULL, NULL),
(335, 'P07', 'Diminuição do desejo sexual', NULL, NULL),
(336, 'P08', 'Diminuição da satisfação sexual', NULL, NULL),
(337, 'P09', 'Preocupação com a preferência sexual', NULL, NULL),
(338, 'P10', 'Gaguejar/balbuciar/tiques', NULL, NULL),
(339, 'P11', 'Problemas de alimentação da criança', NULL, NULL),
(340, 'P12', 'Molhar a cama/enurese', NULL, NULL),
(341, 'P13', 'Encoprese/outros problemas de incontinência fecal', NULL, NULL),
(342, 'P15', 'Abuso crônico de álcool', NULL, NULL),
(343, 'P16', 'Abuso agudo de álcool', NULL, NULL),
(344, 'P17', 'Abuso do tabaco', NULL, NULL),
(345, 'P18', 'Abuso de medicação', NULL, NULL),
(346, 'P19', 'Abuso de drogas', NULL, NULL),
(347, 'P20', 'Alterações da memória', NULL, NULL),
(348, 'P22', 'Sinais/sintomas relacionados ao comportamento da criança', NULL, NULL),
(349, 'P23', 'Sinais/sintomas relacionados ao comportamento do adolescente', NULL, NULL),
(350, 'P24', 'Dificuldades específicas de aprendizagem', NULL, NULL),
(351, 'P25', 'Problemas da fase de vida de adulto', NULL, NULL),
(352, 'P27', 'Medo de perturbações mentais', NULL, NULL),
(353, 'P28', 'Limitação funcional/incapacidade', NULL, NULL),
(354, 'P29', 'Sinais/sintomas psicológicos, outros', NULL, NULL),
(355, 'P70', 'Demência', NULL, NULL),
(356, 'P71', 'Outras psicoses orgânicas NE', NULL, NULL),
(357, 'P72', 'Esquizofrenia', NULL, NULL),
(358, 'P73', 'Psicose afetiva', NULL, NULL),
(359, 'P74', 'Distúrbio ansioso/estado de ansiedade', NULL, NULL),
(360, 'P75', 'Somatização', NULL, NULL),
(361, 'P76', 'Perturbações depressivas', NULL, NULL),
(362, 'P77', 'Suicídio/tentativa de suicídio', NULL, NULL),
(363, 'P78', 'Neurastenia', NULL, NULL),
(364, 'P79', 'Fobia/perturbação compulsiva', NULL, NULL),
(365, 'P80', 'Perturbações de personalidade', NULL, NULL),
(366, 'P81', 'Perturbação hipercinética', NULL, NULL),
(367, 'P82', 'Estresse pós-traumático', NULL, NULL),
(368, 'P85', 'Retardo/Atraso mental', NULL, NULL),
(369, 'P86', 'Anorexia nervosa, bulimia', NULL, NULL),
(370, 'P98', 'Outras psicoses NE', NULL, NULL),
(371, 'P99', 'Outras perturbações psicológicas', NULL, NULL),
(372, 'R01', 'Dor atribuída ao aparelho respiratório', NULL, NULL),
(373, 'R02', 'Dificuldade respiratória, dispneia', NULL, NULL),
(374, 'R03', 'Respiração ruidosa', NULL, NULL),
(375, 'R04', 'Outros problemas respiratórios', NULL, NULL),
(376, 'R05', 'Tosse', NULL, NULL),
(377, 'R06', 'Hemorrhagia nasal/epistaxe', NULL, NULL),
(378, 'R07', 'Espirro/congestão nasal', NULL, NULL),
(379, 'R08', 'Outros sinais/sintomas nasais', NULL, NULL),
(380, 'R09', 'Sinais/sintomas dos seios paranasais', NULL, NULL),
(381, 'R21', 'Sinais/sintomas da garganta', NULL, NULL),
(382, 'R23', 'Sinais/sintomas da voz', NULL, NULL),
(383, 'R24', 'Hemoptise', NULL, NULL),
(384, 'R25', 'Expectoração/mucosidade anormal', NULL, NULL),
(385, 'R26', 'Medo de câncer do aparelho respiratório', NULL, NULL),
(386, 'R27', 'Medo de outras doenças respiratórias', NULL, NULL),
(387, 'R28', 'Limitação funcional/incapacidade', NULL, NULL),
(388, 'R29', 'Sinais/sintomas do aparelho respiratório, outros', NULL, NULL),
(389, 'R71', 'Tosse convulsa/ pertussis', NULL, NULL),
(390, 'R72', 'Infecção estreptocócica da orofaringe', NULL, NULL),
(391, 'R73', 'Abscesso/furúnculo no nariz', NULL, NULL),
(392, 'R74', 'Infecção aguda do aparelho respiratório superior (IVAS)', NULL, NULL),
(393, 'R75', 'Sinusite crônica/aguda', NULL, NULL),
(394, 'R76', 'Amigdalite aguda', NULL, NULL),
(395, 'R77', 'Laringite/traqueíte aguda', NULL, NULL),
(396, 'R78', 'Bronquite/bronquiolite aguda', NULL, NULL),
(397, 'R79', 'Bronquite crônica', NULL, NULL),
(398, 'R80', 'Gripe', NULL, NULL),
(399, 'R81', 'Pneumonia', NULL, NULL),
(400, 'R82', 'Pleurite/derrame pleural', NULL, NULL),
(401, 'R83', 'Outra infecção respiratória', NULL, NULL),
(402, 'R84', 'Neoplasia maligna dos brônquios/pulmão', NULL, NULL),
(403, 'R85', 'Outra neoplasia respiratória maligna', NULL, NULL),
(404, 'R86', 'Neoplasia benigna respiratória', NULL, NULL),
(405, 'R87', 'Corpo estranho nariz/laringe/brônquios', NULL, NULL),
(406, 'R88', 'Outra lesão respiratória', NULL, NULL),
(407, 'R89', 'Malformação congênita do aparelho respiratório', NULL, NULL),
(408, 'R90', 'Hipertrofia das amígdalas/adenóides', NULL, NULL),
(409, 'R92', 'Neoplasia respiratória NE', NULL, NULL),
(410, 'R95', 'Doença pulmonar obstrutiva crônica', NULL, NULL),
(411, 'R96', 'Asma', NULL, NULL),
(412, 'R97', 'Rinite alérgica', NULL, NULL),
(413, 'R98', 'Síndrome de hiperventilação', NULL, NULL),
(414, 'R99', 'Outras doenças respiratórias', NULL, NULL),
(415, 'S01', 'Dor/sensibilidade dolorosa da pele', NULL, NULL),
(416, 'S02', 'Prurido', NULL, NULL),
(417, 'S03', 'Verrugas', NULL, NULL),
(418, 'S04', 'Tumor/inchaço localizado', NULL, NULL),
(419, 'S05', 'Tumores/inchaços generalizados', NULL, NULL),
(420, 'S06', 'Erupção cutânea localizada', NULL, NULL),
(421, 'S07', 'Erupção cutânea generalizada', NULL, NULL),
(422, 'S08', 'Alterações da cor da pele', NULL, NULL),
(423, 'S09', 'Infecção dos dedos das mãos/pés', NULL, NULL),
(424, 'S10', 'Furúnculo/carbúnculo', NULL, NULL),
(425, 'S11', 'Infecção pós-traumática da pele', NULL, NULL),
(426, 'S12', 'Picada ou mordedura de inseto', NULL, NULL),
(427, 'S13', 'Mordedura animal/humana', NULL, NULL),
(428, 'S14', 'Queimadura/escaldão', NULL, NULL),
(429, 'S15', 'Corpo estranho na pele', NULL, NULL),
(430, 'S16', 'Traumatismo/contusão', NULL, NULL),
(431, 'S17', 'Abrasão/arranhão/bolhas', NULL, NULL),
(432, 'S18', 'Laceração/corte', NULL, NULL),
(433, 'S19', 'Outra lesão cutânea', NULL, NULL),
(434, 'S20', 'Calos/calosidades', NULL, NULL),
(435, 'S21', 'Sinais/sintomas da textura da pele', NULL, NULL),
(436, 'S22', 'Sinais/sintomas das unhas', NULL, NULL),
(437, 'S23', 'Queda de cabelo/calvície', NULL, NULL),
(438, 'S24', 'Sinais/sintomas do cabelo/couro cabeludo', NULL, NULL),
(439, 'S26', 'Medo de câncer de pele', NULL, NULL),
(440, 'S27', 'Medo de outra doença da pele', NULL, NULL),
(441, 'S28', 'Limitação funcional/incapacidade', NULL, NULL),
(442, 'S29', 'Sinais/sintomas da pele, outros', NULL, NULL),
(443, 'S70', 'Herpes zoster', NULL, NULL),
(444, 'S71', 'Herpes simples', NULL, NULL),
(445, 'S72', 'Escabiose/outras acaríases', NULL, NULL),
(446, 'S73', 'Pediculose/outras infecções da pele', NULL, NULL),
(447, 'S74', 'Dermatofitose', NULL, NULL),
(448, 'S75', 'Monilíase oral/candidíase na pele', NULL, NULL),
(449, 'S76', 'Outras infecções da pele', NULL, NULL),
(450, 'S77', 'Neoplasias malignas da pele', NULL, NULL),
(451, 'S78', 'Lipoma', NULL, NULL),
(452, 'S79', 'Neoplasia cutânea benigna/incerta', NULL, NULL),
(453, 'S80', 'Ceratose/ Queratose solar/queimadura solar', NULL, NULL),
(454, 'S81', 'Hemangioma/linfangioma', NULL, NULL),
(455, 'S82', 'Nevos/sinais da pele', NULL, NULL),
(456, 'S83', 'Lesões da pele congênitas, outras', NULL, NULL),
(457, 'S84', 'Impetigo', NULL, NULL),
(458, 'S85', 'Cisto pilonidal/fistula', NULL, NULL),
(459, 'S86', 'Dermatite seborréica', NULL, NULL),
(460, 'S87', 'Dermatite/eczema atópico', NULL, NULL),
(461, 'S88', 'Dermatite de contato/alérgica', NULL, NULL),
(462, 'S89', 'Dermatite das fraldas', NULL, NULL),
(463, 'S90', 'Pitiríase rosada', NULL, NULL),
(464, 'S91', 'Psoríase', NULL, NULL),
(465, 'S92', 'Doença das glândulas sudoríparas', NULL, NULL),
(466, 'S93', 'Cisto sebáceo', NULL, NULL),
(467, 'S94', 'Unha encravada', NULL, NULL),
(468, 'S95', 'Molusco contagioso', NULL, NULL),
(469, 'S96', 'Acne', NULL, NULL),
(470, 'S97', 'Úlcera crônica da pele', NULL, NULL),
(471, 'S98', 'Urticária', NULL, NULL),
(472, 'S99', 'Outras doenças da pele', NULL, NULL),
(473, 'T01', 'Sede excessiva', NULL, NULL),
(474, 'T02', 'Apetite excessivo', NULL, NULL),
(475, 'T03', 'Perda de apetite', NULL, NULL),
(476, 'T04', 'Problemas alimentares de lactente/criança', NULL, NULL),
(477, 'T05', 'Problemas alimentares do adulto', NULL, NULL),
(478, 'T07', 'Aumento de peso', NULL, NULL),
(479, 'T08', 'Perda de peso', NULL, NULL),
(480, 'T10', 'Atraso do crescimento', NULL, NULL),
(481, 'T11', 'Desidratação', NULL, NULL),
(482, 'T26', 'Medo de câncer do sistema endócrino', NULL, NULL),
(483, 'T27', 'Medo de outra doença endócrina/metabólica', NULL, NULL),
(484, 'T28', 'Limitação funcional/incapacidade', NULL, NULL),
(485, 'T29', 'Sinais/sintomas endocrinológicos/metabólicos/nutricionais, outros', NULL, NULL),
(486, 'T70', 'Infecção endócrina', NULL, NULL),
(487, 'T71', 'Neoplasia maligna da tiroide', NULL, NULL),
(488, 'T72', 'Neoplasia benigna da tiroide', NULL, NULL),
(489, 'T73', 'Outra neoplasia endócrina NE', NULL, NULL),
(490, 'T78', 'Cisto do canal tiroglosso', NULL, NULL),
(491, 'T80', 'Malformação congénita endócrina/metabólica', NULL, NULL),
(492, 'T81', 'Bócio', NULL, NULL),
(493, 'T82', 'Obesidade', NULL, NULL),
(494, 'T83', 'Excesso de peso', NULL, NULL),
(495, 'T85', 'Hipertiroidismo/tireotoxicose', NULL, NULL),
(496, 'T86', 'Hipotiroidismo/mixedema', NULL, NULL),
(497, 'T87', 'Hipoglicemia', NULL, NULL),
(498, 'T89', 'Diabetes insulino-dependente', NULL, NULL),
(499, 'T90', 'Diabetes não insulino-dependente', NULL, NULL),
(500, 'T92', 'Gota', NULL, NULL),
(501, 'T93', 'Alteração no metabolismo dos lipídios', NULL, NULL),
(502, 'T99', 'Outras doenças endocrinológica/metabólica/nutricionais', NULL, NULL),
(503, 'U01', 'Disúria/micção dolorosa', NULL, NULL),
(504, 'U02', 'Micção frequente/urgência urinária/polaciúria', NULL, NULL),
(505, 'U04', 'Incontinência urinária', NULL, NULL),
(506, 'U05', 'Outros problemas com a micção', NULL, NULL),
(507, 'U06', 'Hematúria', NULL, NULL),
(508, 'U07', 'Outros sinais/sintomas urinários', NULL, NULL),
(509, 'U08', 'Retenção urinária', NULL, NULL),
(510, 'U13', 'Sinais/sintomas da bexiga, outros', NULL, NULL),
(511, 'U14', 'Sinais/sintomas dos rins', NULL, NULL),
(512, 'U26', 'Medo de câncer no aparelho urinário', NULL, NULL),
(513, 'U27', 'Medo de outra doença urinária', NULL, NULL),
(514, 'U28', 'Limitação funcional/incapacidade', NULL, NULL),
(515, 'U29', 'Sinais/sintomas aparelho urinário, outros', NULL, NULL),
(516, 'U70', 'Pielonefrite', NULL, NULL),
(517, 'U71', 'Cistite/outra infecção urinária', NULL, NULL),
(518, 'U72', 'Uretrite', NULL, NULL),
(519, 'U75', 'Neoplasia maligna do rim', NULL, NULL),
(520, 'U76', 'Neoplasia benigna do rim', NULL, NULL),
(521, 'U77', 'Neoplasia maligna do aparelho urinário, outra', NULL, NULL),
(522, 'U78', 'Neoplasia benigna do aparelho urinário', NULL, NULL),
(523, 'U79', 'Neoplasia do aparelho urinário NE', NULL, NULL),
(524, 'U80', 'Lesões traumáticas do aparelho urinário', NULL, NULL),
(525, 'U85', 'Malformação congênita do aparelho urinário', NULL, NULL),
(526, 'U88', 'Glomerulonefrite/síndrome nefrótica', NULL, NULL),
(527, 'U90', 'Albuminúria/proteinúria ortostática', NULL, NULL),
(528, 'U95', 'Cálculo urinário', NULL, NULL),
(529, 'U98', 'Análise de urina anormal NE', NULL, NULL),
(530, 'U99', 'Outras doenças urinárias', NULL, NULL),
(531, 'W01', 'Questão sobre gravidez', NULL, NULL),
(532, 'W02', 'Medo de estar grávida', NULL, NULL),
(533, 'W03', 'Hemorrhagia antes do parto', NULL, NULL),
(534, 'W05', 'Vômitos/náuseas durante a gravidez', NULL, NULL),
(535, 'W10', 'Contracepção pós-coital', NULL, NULL),
(536, 'W11', 'Contracepção oral', NULL, NULL),
(537, 'W12', 'Contracepção intra-uterina/Dispositivo Intrauterino/DIU', NULL, NULL),
(538, 'W13', 'Esterilização', NULL, NULL),
(539, 'W14', 'Contracepção/outros', NULL, NULL),
(540, 'W15', 'Infertilidade/subfertildade', NULL, NULL),
(541, 'W17', 'Hemorrhagia pós-parto', NULL, NULL),
(542, 'W18', 'Sinais/sintomas pós-parto', NULL, NULL),
(543, 'W19', 'Sinais/sintomas da mama/lactação', NULL, NULL),
(544, 'W21', 'Preocupação com a imagem corporal na gravidez', NULL, NULL),
(545, 'W27', 'Medo de complicações na gravidez', NULL, NULL),
(546, 'W28', 'Limitação funcional/incapacidade', NULL, NULL),
(547, 'W29', 'Sinais/sintomas da gravidez, outros', NULL, NULL),
(548, 'W70', 'Sepsis/infecção puerperal', NULL, NULL),
(549, 'W71', 'Infecções que complicam a gravidez', NULL, NULL),
(550, 'W72', 'Neoplasia maligna relacionada com gravidez', NULL, NULL),
(551, 'W73', 'Neoplasia benigna/incerta relacionada com a gravidez', NULL, NULL),
(552, 'W75', 'Lesões traumáticas que complicam a gravidez', NULL, NULL),
(553, 'W76', 'Malformação congénita que complica a gravidez', NULL, NULL),
(554, 'W78', 'Gravidez', NULL, NULL),
(555, 'W79', 'Gravidez não desejada', NULL, NULL),
(556, 'W80', 'Gravidez ectópica', NULL, NULL),
(557, 'W81', 'Toxemia gravídica/DHEG', NULL, NULL),
(558, 'W82', 'Aborto espontâneo', NULL, NULL),
(559, 'W83', 'Aborto provocado', NULL, NULL),
(560, 'W84', 'Gravidez de alto risco', NULL, NULL),
(561, 'W85', 'Diabetes gestacional', NULL, NULL),
(562, 'W90', 'Parto sem complicações de nascido vivo', NULL, NULL),
(563, 'W91', 'Parto sem complicações de natimorto', NULL, NULL),
(564, 'W92', 'Parto com complicações de nascido vivo', NULL, NULL),
(565, 'W93', 'Parto com complicações de natimorto', NULL, NULL),
(566, 'W94', 'Mastite puerperal', NULL, NULL),
(567, 'W95', 'Outros problemas da mama durante gravidez/puerpério', NULL, NULL),
(568, 'W96', 'Outras complicações do puerpério', NULL, NULL),
(569, 'W99', 'Outros problemas da gravidez/parto', NULL, NULL),
(570, 'X01', 'Dor genital', NULL, NULL),
(571, 'X02', 'Dores menstruais', NULL, NULL),
(572, 'X03', 'Dores intermenstruais', NULL, NULL),
(573, 'X04', 'Relação sexual dolorosa na mulher', NULL, NULL),
(574, 'X05', 'Menstruação escassa/ausente', NULL, NULL),
(575, 'X06', 'Menstruação excessiva', NULL, NULL),
(576, 'X07', 'Menstruação irregular/frequente', NULL, NULL),
(577, 'X08', 'Hemorrhagia intermenstrual', NULL, NULL),
(578, 'X09', 'Sinais/sintomas pré-menstruais', NULL, NULL),
(579, 'X10', 'Desejo de alterar a data menstruação', NULL, NULL),
(580, 'X11', 'Sinais/sintomas da menopausa/climatério', NULL, NULL),
(581, 'X12', 'Hemorrhagia pós-menopausa', NULL, NULL),
(582, 'X13', 'Hemorrhagia pós-coital', NULL, NULL),
(583, 'X14', 'Secreção vaginal', NULL, NULL),
(584, 'X15', 'Sinais/sintomas da vagina', NULL, NULL),
(585, 'X16', 'Sinais/sintomas da vulva', NULL, NULL),
(586, 'X17', 'Sinais/sintomas da pélvis feminina', NULL, NULL),
(587, 'X18', 'Dor na mama feminina', NULL, NULL),
(588, 'X19', 'Tumor ou nódulo na mama feminina', NULL, NULL),
(589, 'X20', 'Sinais/sintomas do mamilo da mulher', NULL, NULL),
(590, 'X21', 'Sinais/sintomas da mama feminina, outros', NULL, NULL),
(591, 'X22', 'Preocupação com a aparência da mama feminina', NULL, NULL),
(592, 'X23', 'Medo de doença de transmissão sexual', NULL, NULL),
(593, 'X24', 'Medo de disfunção sexual', NULL, NULL),
(594, 'X25', 'Medo de câncer genital', NULL, NULL),
(595, 'X26', 'Medo de câncer na mama', NULL, NULL),
(596, 'X27', 'Medo de outra doença genital/mama', NULL, NULL),
(597, 'X28', 'Limitação funcional/incapacidade', NULL, NULL),
(598, 'X29', 'Sinais/sintomas do aparelho genital feminino, outra', NULL, NULL),
(599, 'X70', 'Sífilis feminina', NULL, NULL),
(600, 'X71', 'Gonorréia feminina', NULL, NULL),
(601, 'X72', 'Candidíase genital feminina', NULL, NULL),
(602, 'X73', 'Tricomoníase genital feminina', NULL, NULL),
(603, 'X74', 'Doença inflamatória pélvica', NULL, NULL),
(604, 'X75', 'Neoplasia maligna do colo', NULL, NULL),
(605, 'X76', 'Neoplasia maligna da mama feminina', NULL, NULL),
(606, 'X77', 'Neoplasia maligna genital feminina, outra', NULL, NULL),
(607, 'X78', 'Fibromioma uterino', NULL, NULL),
(608, 'X79', 'Neoplasia benigna da mama feminina/fibroadenoma', NULL, NULL),
(609, 'X80', 'Neoplasia benigna genital', NULL, NULL),
(610, 'X81', 'Neoplasia genital feminina, outra/NE', NULL, NULL),
(611, 'X82', 'Lesão traumática genital feminina', NULL, NULL),
(612, 'X83', 'Malformações congênitas genitais', NULL, NULL),
(613, 'X84', 'Vaginite/vulvite NE', NULL, NULL),
(614, 'X85', 'Doença do colo NE', NULL, NULL),
(615, 'X86', 'Esfregaço de Papanicolau/colpocitologia oncótica anormal', NULL, NULL),
(616, 'X87', 'Prolapso utero-vaginal', NULL, NULL),
(617, 'X88', 'Doença fibrocística da mama', NULL, NULL),
(618, 'X89', 'Síndrome da tensão pré-menstrual', NULL, NULL),
(619, 'X90', 'Herpes genital feminino', NULL, NULL),
(620, 'X91', 'Condiloma acuminado feminino', NULL, NULL),
(621, 'X92', 'Infecção por clamídia', NULL, NULL),
(622, 'X99', 'Doença genital feminina, outra', NULL, NULL),
(623, 'Y01', 'Dor no pênis', NULL, NULL),
(624, 'Y02', 'Dor no escroto/testículos', NULL, NULL),
(625, 'Y03', 'Secreção uretral', NULL, NULL),
(626, 'Y04', 'Sinais/sintomas do pênis, outros', NULL, NULL),
(627, 'Y05', 'Sinais/sintomas do escroto/testículos, outros', NULL, NULL),
(628, 'Y06', 'Sinais/sintomas da próstata', NULL, NULL),
(629, 'Y07', 'Impotência NE', NULL, NULL),
(630, 'Y08', 'Sinais/sintomas da função sexual masculina, outros', NULL, NULL),
(631, 'Y10', 'Infertilidade/subfertildade masculina', NULL, NULL),
(632, 'Y13', 'Esterilização masculina', NULL, NULL),
(633, 'Y14', 'Planejamento familiar, outros', NULL, NULL),
(634, 'Y16', 'Sinais/sintomas da mama masculina', NULL, NULL),
(635, 'Y24', 'Medo de disfunção sexual masculina', NULL, NULL),
(636, 'Y25', 'Medo de doença sexualmente transmissível', NULL, NULL),
(637, 'Y26', 'Medo de câncer genital masculino', NULL, NULL),
(638, 'Y27', 'Medo de doença genital masculina, outra', NULL, NULL),
(639, 'Y28', 'Limitação funcional/incapacidade', NULL, NULL),
(640, 'Y29', 'Sinais/sintomas, outros', NULL, NULL),
(641, 'Y70', 'Sífilis masculina', NULL, NULL),
(642, 'Y71', 'Gonorréia masculina', NULL, NULL),
(643, 'Y72', 'Herpes genital', NULL, NULL),
(644, 'Y73', 'Prostatite/vesiculite seminal', NULL, NULL),
(645, 'Y74', 'Orquite/epididimite', NULL, NULL),
(646, 'Y75', 'Balanite/Balanopostite', NULL, NULL),
(647, 'Y76', 'Condiloma acuminado', NULL, NULL),
(648, 'Y77', 'Neoplasia maligna da próstata', NULL, NULL),
(649, 'Y78', 'Neoplasia maligna genital masculina, outra', NULL, NULL),
(650, 'Y79', 'Neoplasia benigna genital masculina NE', NULL, NULL),
(651, 'Y80', 'Traumatismo genital masculino, outro', NULL, NULL),
(652, 'Y81', 'Fimose/prepúcio redundante', NULL, NULL),
(653, 'Y82', 'Hypospádias', NULL, NULL),
(654, 'Y83', 'Testículo não descido/Criptorquidia/Testículo ectópico', NULL, NULL),
(655, 'Y84', 'Malformação genital congênita masculina, outra', NULL, NULL),
(656, 'Y85', 'Hipertrofia benigna da próstata/hiperplasia prostática benigna', NULL, NULL),
(657, 'Y86', 'Hidrocele', NULL, NULL),
(658, 'Y99', 'Doença genital masculina, outra', NULL, NULL),
(659, 'Z01', 'Pobreza/problemas econômicos', NULL, NULL),
(660, 'Z02', 'Problemas relacionados a água/alimentação', NULL, NULL),
(661, 'Z03', 'Problemas de habitação/vizinhança', NULL, NULL),
(662, 'Z04', 'Problema socio-cultural', NULL, NULL),
(663, 'Z05', 'Problemas com condições de trabalho', NULL, NULL),
(664, 'Z06', 'Problemas de desemprego', NULL, NULL),
(665, 'Z07', 'Problemas relacionados com educação', NULL, NULL),
(666, 'Z08', 'Problema relacionado com sistema de segurança social', NULL, NULL),
(667, 'Z09', 'Problema de ordem legal', NULL, NULL),
(668, 'Z10', 'Problema relacionado com sistema de saúde', NULL, NULL),
(669, 'Z11', 'Problema relacionado com estar doente', NULL, NULL),
(670, 'Z12', 'Problema de relacionamento com parceiro/conjugal', NULL, NULL),
(671, 'Z13', 'Problema comportamental do parceiro/companheiro', NULL, NULL),
(672, 'Z14', 'Problema por doença do parceiro/companheiro', NULL, NULL),
(673, 'Z15', 'Perda ou falecimento do parceiro/companheiro', NULL, NULL),
(674, 'Z16', 'Problema de relacionamento com criança', NULL, NULL),
(675, 'Z18', 'Problema com criança doente', NULL, NULL),
(676, 'Z19', 'Perda ou falecimento de criança', NULL, NULL),
(677, 'Z20', 'Problema de relacionamento com familiares', NULL, NULL),
(678, 'Z21', 'Problema comportamental de familiar', NULL, NULL),
(679, 'Z22', 'Problema por doença familiar', NULL, NULL),
(680, 'Z23', 'Perda/falecimento de familiar', NULL, NULL),
(681, 'Z24', 'Problema de relacionamento com amigos', NULL, NULL),
(682, 'Z25', 'Ato ou acontecimento violento', NULL, NULL),
(683, 'Z27', 'Medo de problema social', NULL, NULL),
(684, 'Z28', 'Limitação funcional/incapacidade', NULL, NULL),
(685, 'Z29', 'Problema social NE', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo_ciap`
--

CREATE TABLE `grupo_ciap` (
  `codigo` varchar(4) DEFAULT NULL,
  `enfermidade` varchar(200) DEFAULT NULL,
  `componente` varchar(100) DEFAULT NULL,
  `caso_clinico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `grupo_ciap`
--

INSERT INTO `grupo_ciap` (`codigo`, `enfermidade`, `componente`, `caso_clinico`) VALUES
('30', 'Exame médico/avaliação de saúde - completo', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('31', 'Exame médico/avaliação de saúde - parcial', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('32', 'Teste de sensibilidade', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('33', 'Exame microbiológico/imunológico', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('34', 'Análise de sangue', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('35', 'Análise de urina', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('36', 'Análise de fezes', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('37', 'Citologia esfoliativa/histologia', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('38', 'Outras análises laboratoriais NE', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('39', 'Teste de função física', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('40', 'Endoscopia diagnóstica', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('41', 'Radiologia diagnóstica', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('42', 'Eletrocardiograma', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('43', 'Vacinação/medicação preventiva', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('44', 'Outros procedimentos diagnósticos', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('45', 'Educação em saúde/aconselhamento/dieta', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('46', 'Consulta com profissional de APS', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('47', 'Consulta com especialista', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('48', 'Esclarecimento/discussão do motivo da consulta', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('49', 'Outros procedimentos preventivos', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('50', 'Medicação/prescrição/renovação/ injeção', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('51', 'Incisão/drenagem/aspiração/remoção', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('52', 'Excisão /biópsia/remoção/debridamento/ cauterização', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('53', 'Cateterização/intubação', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('54', 'Reparação/sutura/gesso/prótese', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('55', 'Injeção local/infiltração', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('56', 'Ligadura/compressa /tamponamento', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('57', 'Medicina física/reabilitação', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('58', 'Aconselhamento/escuta terapêutica', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('59', 'Outros procedimentos terapêuticos/pequena cirurgia NE', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('60', 'Resultados de análises/procedimentos', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('61', 'Contra referência de outro prestador - estado de exames/teste/ análise', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('62', 'Procedimento administrativo', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('63', 'Consulta de seguimento não especificada', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('64', 'Episódio / problema iniciado pelo prestador', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('65', 'Episódio / problema iniciado por outro NE', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('66', 'Referenciado a outro prestador /enfermeiro /assistente social/terapeuta', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('67', 'Referenciado para médico/especialista/ clínica/hospital', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('68', 'Outras referenciações NE', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('69', 'Outro motivo de consulta NE', 'PROCEDIMENTOS', 'PROCEDIMENTOS'),
('A01', 'Dor generalizada /múltipla', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A02', 'Arrepios/ calafrios', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A03', 'Febre', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A04', 'Debilidade/cansaço geral/fadiga', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A05', 'Sentir-se doente', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A06', 'Desmaio/síncope', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A07', 'Coma', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A08', 'Inchaço', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A09', 'Problemas de sudorese', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A10', 'Sangramento/Hemorragia NE', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A11', 'Dores torácicas NE', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A13', 'Receio/Medo do tratamento', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A16', 'Criança irritável', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A18', 'Preocupação com aparência', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A20', 'Pedido/discussão eutanásia', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A21', 'Fator de risco de malignidade', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A23', 'Fator de risco NE', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A25', 'Medo de morrer/medo da morte', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A26', 'Medo de câncer NE', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A27', 'Medo de outra doença NE', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A28', 'Limitação funcional/incapacidade NE', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A29', 'Outros sinais/sintomas gerais', 'GERAL E INESPECÍFICO', 'SINAIS/SINTOMAS'),
('A70', 'Tuberculose', 'GERAL E INESPECÍFICO', 'INFECÇÕES'),
('A71', 'Sarampo', 'GERAL E INESPECÍFICO', 'INFECÇÕES'),
('A72', 'Varicela', 'GERAL E INESPECÍFICO', 'INFECÇÕES'),
('A73', 'Malária', 'GERAL E INESPECÍFICO', 'INFECÇÕES'),
('A74', 'Rubéola', 'GERAL E INESPECÍFICO', 'INFECÇÕES'),
('A75', 'Mononucleose infecciosa', 'GERAL E INESPECÍFICO', 'INFECÇÕES'),
('A76', 'Outro exantema viral', 'GERAL E INESPECÍFICO', 'INFECÇÕES'),
('A77', 'Dengue e outras doenças virais NE', 'GERAL E INESPECÍFICO', 'INFECÇÕES'),
('A78', 'Hanseníase e outras doenças infecciosas NE', 'GERAL E INESPECÍFICO', 'INFECÇÕES'),
('A79', 'Carcinomatose (localização primária desconhecida)', 'GERAL E INESPECÍFICO', 'NEOPLASIAS'),
('A80', 'Lesão traumática/acidente NE', 'GERAL E INESPECÍFICO', 'TRAUMATISMOS'),
('A81', 'Politraumatismos/ferimentos múltiplos', 'GERAL E INESPECÍFICO', 'TRAUMATISMOS'),
('A82', 'Efeito secundário de lesão traumática', 'GERAL E INESPECÍFICO', 'TRAUMATISMOS'),
('A84', 'Intoxicação por medicamento', 'GERAL E INESPECÍFICO', 'TRAUMATISMOS'),
('A85', 'Efeito adverso de fármaco dose correta', 'GERAL E INESPECÍFICO', 'TRAUMATISMOS'),
('A86', 'Efeito tóxico de substância não medicinal', 'GERAL E INESPECÍFICO', 'TRAUMATISMOS'),
('A87', 'Complicações de tratamento médico', 'GERAL E INESPECÍFICO', 'TRAUMATISMOS'),
('A88', 'Efeito adverso de fator físico', 'GERAL E INESPECÍFICO', 'TRAUMATISMOS'),
('A89', 'Efeito da prótese', 'GERAL E INESPECÍFICO', 'TRAUMATISMOS'),
('A90', 'Malformação congênita NE/múltiplas', 'GERAL E INESPECÍFICO', 'ANOMALIAS CONGÊNITAS'),
('A91', 'Investigação com resultado anormal NE', 'GERAL E INESPECÍFICO', 'OUTROS DIAGNÓSTICOS'),
('A92', 'Alergia/reação alérgica NE', 'GERAL E INESPECÍFICO', 'OUTROS DIAGNÓSTICOS'),
('A93', 'Recém-nascido prematuro', 'GERAL E INESPECÍFICO', 'OUTROS DIAGNÓSTICOS'),
('A94', 'Morbidade perinatal, outra', 'GERAL E INESPECÍFICO', 'OUTROS DIAGNÓSTICOS'),
('A95', 'Mortalidade perinatal', 'GERAL E INESPECÍFICO', 'OUTROS DIAGNÓSTICOS'),
('A96', 'Morte', 'GERAL E INESPECÍFICO', 'OUTROS DIAGNÓSTICOS'),
('A97', 'Sem doença', 'GERAL E INESPECÍFICO', 'OUTROS DIAGNÓSTICOS'),
('A98', 'Medicina preventiva/manutenção da saúde', 'GERAL E INESPECÍFICO', 'OUTROS DIAGNÓSTICOS'),
('A99', 'Outras doenças gerais NE', 'GERAL E INESPECÍFICO', 'OUTROS DIAGNÓSTICOS'),
('B02', 'Gânglio linfático aumentado/doloroso', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'SINAIS/SINTOMAS'),
('B04', 'Sinais/sintomas sangue', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'SINAIS/SINTOMAS'),
('B25', 'Medo de VIH/ HIV/SIDA/ AIDS', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'SINAIS/SINTOMAS'),
('B26', 'Medo de câncer no sangue/linfático', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'SINAIS/SINTOMAS'),
('B27', 'Medo de outras doenças do sangue /vasos linfáticos', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'SINAIS/SINTOMAS'),
('B28', 'Limitação funcional/incapacidade', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'SINAIS/SINTOMAS'),
('B29', 'Outros sinais/ sintomas do sangue/ sistema linfático/ baço NE', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'SINAIS/SINTOMAS'),
('B70', 'Linfadenite aguda', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'INFECÇÕES'),
('B71', 'Linfadenite crônica NE', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'INFECÇÕES'),
('B72', 'Doença de Hodgkin/linfomas', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'NEOPLASIAS'),
('B73', 'Leucemia', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'NEOPLASIAS'),
('B74', 'Outra neoplasia maligna no sangue', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'NEOPLASIAS'),
('B75', 'Neoplasia benigna NE', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'NEOPLASIAS'),
('B76', 'Rotura traumática do baço', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'TRAUMATISMOS'),
('B77', 'Outras lesões traumáticas do sangue/linfa/baço', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'TRAUMATISMOS'),
('B78', 'Anemia hemolítica hereditária', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'ANOMALIAS CONGÊNITAS'),
('B79', 'Outra malformação congênita do sangue/linfática', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'ANOMALIAS CONGÊNITAS'),
('B80', 'Anemia por deficiência de ferro', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'OUTROS DIAGNÓSTICOS'),
('B81', 'Anemia perniciosa/deficiência de folatos', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'OUTROS DIAGNÓSTICOS'),
('B82', 'Outras anemias NE', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'OUTROS DIAGNÓSTICOS'),
('B83', 'Púrpura/defeitos de coagulação', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'OUTROS DIAGNÓSTICOS'),
('B84', 'Glóbulos brancos anormais', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'OUTROS DIAGNÓSTICOS'),
('B87', 'Esplenomegalia', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'OUTROS DIAGNÓSTICOS'),
('B90', 'Infecção por VIH/ HIV/SIDA/ AIDS', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'OUTROS DIAGNÓSTICOS'),
('B99', 'Outra doença do sangue/linfáticos/baço', 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 'OUTROS DIAGNÓSTICOS'),
('D01', 'Dor abdominal generalizada/cólicas', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D02', 'Dores abdominais, epigástricas', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D03', 'Azia/ Queimação', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D04', 'Dor anal/retal', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D05', 'Irritação perianal', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D06', 'Outras dores abdominais localizadas', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D07', 'Dispepsia/indigestão', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D08', 'Flatulência /gases/eructações', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D09', 'Náusea', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D10', 'Vômito', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D11', 'Diarreia', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D12', 'Obstipação', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D13', 'Icterícia', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D14', 'Hematêmese/vômito sangue', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D15', 'Melena', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D16', 'Hemorragia retal', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D17', 'Incontinência fecal', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D18', 'Alterações nas fezes/mov. intestinais', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D19', 'Sinais/sintomas dos dentes/gengivas', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D20', 'Sinais/sintomas da boca/língua/lábios', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D21', 'Problemas de deglutição', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D23', 'Hepatomegalia', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D24', 'Massa abdominal NE', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D25', 'Distensão abdominal', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D26', 'Medo de câncer no aparelho digestivo', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D27', 'Medo de outras doenças aparelho digestivo', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D28', 'Limitação funcional/incapacidade', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D29', 'Outros sinais/sintomas digestivos', 'DIGESTIVO', 'SINAIS/SINTOMAS'),
('D70', 'Infecção gastrointestinal', 'DIGESTIVO', 'INFECÇÕES'),
('D71', 'Caxumba/parotidite epidêmica', 'DIGESTIVO', 'INFECÇÕES'),
('D72', 'Hepatite viral', 'DIGESTIVO', 'INFECÇÕES'),
('D73', 'Gastroenterite, presumível infecção', 'DIGESTIVO', 'INFECÇÕES'),
('D74', 'Neoplasia maligna do estômago', 'DIGESTIVO', 'NEOPLASIAS'),
('D75', 'Neoplasia maligna do cólon/reto', 'DIGESTIVO', 'NEOPLASIAS'),
('D76', 'Neoplasia maligna do pâncreas', 'DIGESTIVO', 'NEOPLASIAS'),
('D77', 'Neoplasia maligna do aparelho digestivo NE', 'DIGESTIVO', 'NEOPLASIAS'),
('D78', 'Neoplasia benigna do aparelho digestivo/incerta', 'DIGESTIVO', 'NEOPLASIAS'),
('D79', 'Corpo estranho no aparelho digestivo', 'DIGESTIVO', 'TRAUMATISMOS'),
('D80', 'Outras lesões traumáticas', 'DIGESTIVO', 'TRAUMATISMOS'),
('D81', 'Malformações congênitas do aparelho digestivo', 'DIGESTIVO', 'ANOMALIAS CONGÊNITAS'),
('D82', 'Doença dos dentes/gengivas', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D83', 'Doença da boca/língua/lábios', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D84', 'Doença do esôfago', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D85', 'Úlcera do duodeno', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D86', 'Úlcera péptica, outra', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D87', 'Alterações funcionais estômago', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D88', 'Apendicite', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D89', 'Hérnia inguinal', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D90', 'Hérnia de hiato /diafragmática', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D91', 'Hérnia abdominal, outras', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D92', 'Doença diverticular intestinal', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D93', 'Síndrome do cólon irritável', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D94', 'Enterite crônica / colite ulcerosa', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D95', 'Fissura anal / abcesso perianal', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D96', 'Lombrigas /outros parasitas', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D97', 'Doenças do fígado /NE', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D98', 'Colecistite, colelitíase', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('D99', 'Outra doença do aparelho digestivo', 'DIGESTIVO', 'OUTROS DIAGNÓSTICOS'),
('F01', 'Dor no olho', 'OLHO', 'SINAIS/SINTOMAS'),
('F02', 'Olho vermelho', 'OLHO', 'SINAIS/SINTOMAS'),
('F03', 'Secreção ocular', 'OLHO', 'SINAIS/SINTOMAS'),
('F04', 'Moscas volantes/pontos luminosos/escotomas/ manchas', 'OLHO', 'SINAIS/SINTOMAS'),
('F05', 'Outras perturbações visuais', 'OLHO', 'SINAIS/SINTOMAS'),
('F13', 'Sensações oculares anormais', 'OLHO', 'SINAIS/SINTOMAS'),
('F14', 'Movimentos oculares anormais', 'OLHO', 'SINAIS/SINTOMAS'),
('F15', 'Aparência anormal nos olhos', 'OLHO', 'SINAIS/SINTOMAS'),
('F16', 'Sinais/sintomas das pálpebras', 'OLHO', 'SINAIS/SINTOMAS'),
('F17', 'Sinais/sintomas relacionados a óculos', 'OLHO', 'SINAIS/SINTOMAS'),
('F18', 'Sinais/sintomas relacionados a lentes de contato', 'OLHO', 'SINAIS/SINTOMAS'),
('F27', 'Medo de doença ocular', 'OLHO', 'SINAIS/SINTOMAS'),
('F28', 'Limitação funcional/incapacidade', 'OLHO', 'SINAIS/SINTOMAS'),
('F29', 'Outros sinais/sintomas oculares', 'OLHO', 'SINAIS/SINTOMAS'),
('F70', 'Conjuntivite infecciosa', 'OLHO', 'INFECÇÕES'),
('F71', 'Conjuntivite alérgica', 'OLHO', 'INFECÇÕES'),
('F72', 'Blefarite/hordéolo/calázio', 'OLHO', 'INFECÇÕES'),
('F73', 'Outras infecções/inflamações oculares', 'OLHO', 'INFECÇÕES'),
('F74', 'Neoplasia do olho/anexos', 'OLHO', 'NEOPLASIAS'),
('F75', 'Contusão/hemorragia ocular', 'OLHO', 'TRAUMATISMOS'),
('F76', 'Corpo estranho ocular', 'OLHO', 'TRAUMATISMOS'),
('F79', 'Outras lesões traumáticas oculares', 'OLHO', 'TRAUMATISMOS'),
('F80', 'Obstrução canal lacrimal da criança', 'OLHO', 'ANOMALIAS CONGÊNITAS'),
('F81', 'Outras malformações congênitas do olho', 'OLHO', 'ANOMALIAS CONGÊNITAS'),
('F82', 'Descolamento da retina', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('F83', 'Retinopatia', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('F84', 'Degeneração macular', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('F85', 'Úlcera da córnea', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('F86', 'Tracoma', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('F91', 'Erro de refração', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('F92', 'Catarata', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('F93', 'Glaucoma', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('F94', 'Cegueira', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('F95', 'Estrabismo', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('F99', 'Outra doenças oculares/anexos', 'OLHO', 'OUTROS DIAGNÓSTICOS'),
('H01', 'Dor de ouvidos', 'OUVIDO', 'SINAIS/SINTOMAS'),
('H02', 'Problemas de audição', 'OUVIDO', 'SINAIS/SINTOMAS'),
('H03', 'Acufeno, zumbidos, ruído, assobios', 'OUVIDO', 'SINAIS/SINTOMAS'),
('H04', 'Secreção no ouvido', 'OUVIDO', 'SINAIS/SINTOMAS'),
('H05', 'Hemorragia no ouvido', 'OUVIDO', 'SINAIS/SINTOMAS'),
('H13', 'Sensação de ouvido tapado', 'OUVIDO', 'SINAIS/SINTOMAS'),
('H15', 'Preocupação com a aparência das orelhas', 'OUVIDO', 'SINAIS/SINTOMAS'),
('H27', 'Medo de doença do ouvido', 'OUVIDO', 'SINAIS/SINTOMAS'),
('H28', 'Limitação funcional/incapacidade', 'OUVIDO', 'SINAIS/SINTOMAS'),
('H29', 'Outros sinais/sintomas ouvido', 'OUVIDO', 'SINAIS/SINTOMAS'),
('H70', 'Otite externa', 'OUVIDO', 'INFECÇÕES'),
('H71', 'Otite média aguda/miringite', 'OUVIDO', 'INFECÇÕES'),
('H72', 'Otite média serosa', 'OUVIDO', 'INFECÇÕES'),
('H73', 'Infecção da Trompa de Eustáquio', 'OUVIDO', 'INFECÇÕES'),
('H74', 'Otite média crônica', 'OUVIDO', 'INFECÇÕES'),
('H75', 'Neoplasia do ouvido', 'OUVIDO', 'NEOPLASIAS'),
('H76', 'Corpo estranho do ouvido', 'OUVIDO', 'TRAUMATISMOS'),
('H77', 'Perfuração do tímpano', 'OUVIDO', 'TRAUMATISMOS'),
('H78', 'Fibrilação/flutter auricular/atrial', 'OUVIDO', 'TRAUMATISMOS'),
('H79', 'Outros traumatismos do ouvido', 'OUVIDO', 'TRAUMATISMOS'),
('H80', 'Malformações congênitas do ouvido', 'OUVIDO', 'ANOMALIAS CONGÊNITAS'),
('H81', 'Cerúmen no ouvido em excesso', 'OUVIDO', 'OUTROS DIAGNÓSTICOS'),
('H82', 'Síndrome vertiginosa', 'OUVIDO', 'OUTROS DIAGNÓSTICOS'),
('H83', 'Otoesclerose', 'OUVIDO', 'OUTROS DIAGNÓSTICOS'),
('H84', 'Presbiacusia', 'OUVIDO', 'OUTROS DIAGNÓSTICOS'),
('H85', 'Lesão acústica', 'OUVIDO', 'OUTROS DIAGNÓSTICOS'),
('H86', 'Surdez', 'OUVIDO', 'OUTROS DIAGNÓSTICOS'),
('H99', 'Outra doença do ouvido/mastóide', 'OUVIDO', 'OUTROS DIAGNÓSTICOS'),
('K01', 'Dor atribuída ao coração', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K02', 'Sensação de pressão/aperto atribuída ao coração', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K03', 'Dores atribuídas ao aparelho circulatório NE', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K04', 'Palpitações/percepção dos batimentos cardíacos', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K05', 'Outras irregularidades dos batimentos cardíacos', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K06', 'Veias proeminentes', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K07', 'Tornozelos inchados/edema', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K22', 'Fator de risco para doença cardiovascular', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K24', 'Medo de doença cardíaca', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K25', 'Medo de hipertensão', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K27', 'Medo de outra doença cardiovascular', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K28', 'Limitação funcional/incapacidade', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K29', 'Outros sinais/sintomas cardiovasculares', 'CIRCULATÓRIO', 'SINAIS/SINTOMAS'),
('K70', 'Doença infecciosa do aparelho circulatório', 'CIRCULATÓRIO', 'INFECÇÕES'),
('K71', 'Febre reumática/cardiopatia', 'CIRCULATÓRIO', 'INFECÇÕES'),
('K72', 'Neoplasia do aparelho circulatório', 'CIRCULATÓRIO', 'NEOPLASIAS'),
('K73', 'Malformações congênitas do aparelho circulatório', 'CIRCULATÓRIO', 'ANOMALIAS CONGÊNITAS'),
('K74', 'Doença cardíaca isquêmica com angina', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K75', 'Infarto ou Enfarte agudo miocárdio', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K76', 'Doença cardíaca isquêmica sem angina', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K77', 'Insuficiência cardíaca', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K78', 'Fibrilação/flutter auricular/atrial', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K79', 'Taquicardia Paroxística', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K80', 'Arritmia cardíaca NE', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K81', 'Sopro cardíaco/arterial NE', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K82', 'Doença cardiopulmonar', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K83', 'Doença valvular cardíaca NE', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K84', 'Outras doenças cardíacas', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K85', 'Pressão arterial elevada', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K86', 'Hipertensão sem complicações', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K87', 'Hipertensão com complicações', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K88', 'Hipotensão postural', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K89', 'Isquemia/acidente cerebral transitória(o)', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K90', 'Trombose/acidente vascular cerebral', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K91', 'Doença vascular cerebral', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K92', 'Aterosclerose/doença vascular periférica', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K93', 'Embolia pulmonar', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K94', 'Flebite/tromboflebite', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K95', 'Veias varicosas da perna', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K96', 'Hemorróidas', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('K99', 'Outras doenças do aparelho circulatório', 'CIRCULATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('L01', 'Sinais/sintomas do pescoço', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L02', 'Sinais/sintomas da região dorsal', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L03', 'Sinais/sintomas da região lombar', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L04', 'Sinais/sintomas do tórax', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L05', 'Sinais/sintomas da axila', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L07', 'Sinais/sintomas da mandíbula', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L08', 'Sinais/sintomas dos ombros', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L09', 'Sinais/sintomas dos braços', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L10', 'Sinais/sintomas dos cotovelos', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L11', 'Sinais/sintomas dos punhos', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L12', 'Sinais/sintomas das mãos e dedos', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L13', 'Sinais/sintomas do quadril', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L14', 'Sinais/sintomas da coxa/perna', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L15', 'Sinais/sintomas do joelho', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L16', 'Sinais/sintomas do tornozelo', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L17', 'Sinais/sintomas do pé/dedos pé', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L18', 'Dores musculares', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L19', 'Sinais/sintomas musculares NE', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L20', 'Sinais/sintomas das articulações NE', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L26', 'Medo de câncer no aparelho músculo-esquelético', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L27', 'Medo de doença no aparelho músculo-esquelético, outro', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L28', 'Limitação funcional/incapacidade', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L29', 'Outros sinais/sintomas do aparelho músculo-esquelético', 'MÚSCULO-ESQUELÉTICO', 'SINAIS/SINTOMAS'),
('L70', 'Infecções do aparelho músculo-esquelético', 'MÚSCULO-ESQUELÉTICO', 'INFECÇÕES'),
('L71', 'Neoplasia maligna do aparelho músculo-esquelético', 'MÚSCULO-ESQUELÉTICO', 'NEOPLASIAS'),
('L72', 'Fratura: rádio/cúbito', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L73', 'Fratura: tíbia/perônio/fíbula', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L74', 'Fratura: osso da mão/pé', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L75', 'Fratura: fêmur', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L76', 'Outras fraturas', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L77', 'Entorses e distensões do tornozelo', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L78', 'Entorses e distensões do joelho', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L79', 'Entorses e distensões das articulações NE', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L80', 'Luxação/subluxação', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L81', 'Traumatismos do aparelho musculoesquelético NE', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L82', 'Malformações congênitas do aparelho músculo-esquelético', 'MÚSCULO-ESQUELÉTICO', 'ANOMALIAS CONGÊNITAS'),
('L83', 'Doenças ou síndromes da coluna cervical', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L84', 'Doenças ou síndromes da coluna sem irradiação de dor', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L85', 'Deformação adquirida da coluna', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L86', 'Síndrome vertebral com irradiação dor', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L87', 'Bursite/tendinite/sinovite NE', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L88', 'Artrite reumatóide/soropositiva', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L89', 'Osteoartrose do quadril', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L90', 'Osteoartrose do joelho', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L91', 'Outras osteoartroses', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L92', 'Síndrome do ombro doloroso', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L93', 'Cotovelo de tenista', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L94', 'Osteocondrose', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L95', 'Osteoporose', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L96', 'Lesão interna aguda do joelho', 'MÚSCULO-ESQUELÉTICO', 'TRAUMATISMOS'),
('L97', 'Neoplasia benigna/incertas', 'MÚSCULO-ESQUELÉTICO', 'NEOPLASIAS'),
('L98', 'Malformação adquirida de um membro', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('L99', 'Outra doença do aparelho músculo-esquelético', 'MÚSCULO-ESQUELÉTICO', 'OUTROS DIAGNÓSTICOS'),
('N01', 'Cefaléia', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N03', 'Dores da face', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N04', 'Síndrome das pernas inquietas', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N05', 'Formigamento/parestesia nos dedos das mãos/pés', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N06', 'Outras alterações da sensibilidade', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N07', 'Convulsões/ataques', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N08', 'Movimentos involuntários anormais', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N16', 'Alterações do olfato/gosto', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N17', 'Vertigens/tonturas', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N18', 'Paralisia/fraqueza', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N19', 'Perturbações da fala', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N26', 'Medo de câncer do sistema neurológico', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N27', 'Medo de outras doenças neurológicas', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N28', 'Limitação funcional/incapacidade', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N29', 'Sinais/sintomas do sistema neurológico, outros', 'NEUROLÓGICO', 'SINAIS/SINTOMAS'),
('N70', 'Poliomielite', 'NEUROLÓGICO', 'INFECÇÕES'),
('N71', 'Meningite/encefalite', 'NEUROLÓGICO', 'INFECÇÕES'),
('N72', 'Tétano', 'NEUROLÓGICO', 'INFECÇÕES'),
('N73', 'Outra infecção neurológica', 'NEUROLÓGICO', 'INFECÇÕES'),
('N74', 'Neoplasia maligna do sistema neurológico', 'NEUROLÓGICO', 'NEOPLASIAS'),
('N75', 'Neoplasia benigna do sistema neurológico', 'NEUROLÓGICO', 'NEOPLASIAS'),
('N76', 'Neoplasia do sistema neurológico de natureza incerta', 'NEUROLÓGICO', 'NEOPLASIAS'),
('N79', 'Concussão', 'NEUROLÓGICO', 'TRAUMATISMOS'),
('N80', 'Outras lesões cranianas', 'NEUROLÓGICO', 'TRAUMATISMOS'),
('N81', 'Outra lesão do sistema neurológico', 'NEUROLÓGICO', 'TRAUMATISMOS'),
('N85', 'Malformações congênitas', 'NEUROLÓGICO', 'ANOMALIAS CONGÊNITAS'),
('N86', 'Esclerose múltipla', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('N87', 'Parkinsonismo', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('N88', 'Epilepsia', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('N89', 'Enxaqueca', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('N90', 'Cefaléia de cluster', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('N91', 'Paralisia facial/paralisia de Bell', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('N92', 'Nevralgia do trigêmeo', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('N93', 'Síndrome do túnel do carpo/Síndrome do canal cárpico', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('N94', 'Neurite/Nevrite/neuropatia periférica', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('N95', 'Cefaléia tensional', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('N99', 'Outras doenças do sistema neurológico', 'NEUROLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P01', 'Sensação de ansiedade/nervosismo/tensão', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P02', 'Reação aguda ao estresse', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P03', 'Tristeza/Sensação de depressão', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P04', 'Sentir/comportar-se de forma irritável/zangada', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P05', 'Sensação/comportamento senil', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P06', 'Perturbação do sono', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P07', 'Diminuição do desejo sexual', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P08', 'Diminuição da satisfação sexual', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P09', 'Preocupação com a preferência sexual', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P10', 'Gaguejar/balbuciar/tiques', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P11', 'Problemas de alimentação da criança', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P12', 'Molhar a cama/enurese', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P13', 'Encoprese/outros problemas de incontinência fecal', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P15', 'Abuso crônico de álcool', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P16', 'Abuso agudo de álcool', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P17', 'Abuso do tabaco', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P18', 'Abuso de medicação', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P19', 'Abuso de drogas', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P20', 'Alterações da memória', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P22', 'Sinais/sintomas relacionados ao comportamento da criança', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P23', 'Sinais/sintomas relacionados ao comportamento do adolescente', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P24', 'Dificuldades específicas de aprendizagem', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P25', 'Problemas da fase de vida de adulto', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P27', 'Medo de perturbações mentais', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P28', 'Limitação funcional/incapacidade', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P29', 'Sinais/sintomas psicológicos, outros', 'PSICOLÓGICO', 'SINAIS/SINTOMAS'),
('P70', 'Demência', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P71', 'Outras psicoses orgânicas NE', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P72', 'Esquizofrenia', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P73', 'Psicose afetiva', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P74', 'Distúrbio ansioso/estado de ansiedade', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P75', 'Somatização', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P76', 'Perturbações depressivas', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P77', 'Suicídio/tentativa de suicídio', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P78', 'Neurastenia', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P79', 'Fobia/perturbação compulsiva', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P80', 'Perturbações de personalidade', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P81', 'Perturbação hipercinética', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P82', 'Estresse pós-traumático', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P85', 'Retardo/Atraso mental', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P86', 'Anorexia nervosa, bulimia', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P98', 'Outras psicoses NE', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('P99', 'Outras perturbações psicológicas', 'PSICOLÓGICO', 'OUTROS DIAGNÓSTICOS'),
('R01', 'Dor atribuída ao aparelho respiratório', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R02', 'Dificuldade respiratória, dispneia', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R03', 'Respiração ruidosa', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R04', 'Outros problemas respiratórios', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R05', 'Tosse', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R06', 'Hemorrhagia nasal/epistaxe', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R07', 'Espirro/congestão nasal', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R08', 'Outros sinais/sintomas nasais', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R09', 'Sinais/sintomas dos seios paranasais', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R21', 'Sinais/sintomas da garganta', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R23', 'Sinais/sintomas da voz', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R24', 'Hemoptise', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R25', 'Expectoração/mucosidade anormal', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R26', 'Medo de câncer do aparelho respiratório', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R27', 'Medo de outras doenças respiratórias', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R28', 'Limitação funcional/incapacidade', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R29', 'Sinais/sintomas do aparelho respiratório, outros', 'RESPIRATÓRIO', 'SINAIS/SINTOMAS'),
('R71', 'Tosse convulsa/ pertussis', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R72', 'Infecção estreptocócica da orofaringe', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R73', 'Abscesso/furúnculo no nariz', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R74', 'Infecção aguda do aparelho respiratório superior (IVAS)', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R75', 'Sinusite crônica/aguda', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R76', 'Amigdalite aguda', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R77', 'Laringite/traqueíte aguda', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R78', 'Bronquite/bronquiolite aguda', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R79', 'Bronquite crônica', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R80', 'Gripe', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R81', 'Pneumonia', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R82', 'Pleurite/derrame pleural', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R83', 'Outra infecção respiratória', 'RESPIRATÓRIO', 'INFECÇÕES'),
('R84', 'Neoplasia maligna dos brônquios/pulmão', 'RESPIRATÓRIO', 'NEOPLASIAS'),
('R85', 'Outra neoplasia respiratória maligna', 'RESPIRATÓRIO', 'NEOPLASIAS'),
('R86', 'Neoplasia benigna respiratória', 'RESPIRATÓRIO', 'NEOPLASIAS'),
('R87', 'Corpo estranho nariz/laringe/brônquios', 'RESPIRATÓRIO', 'TRAUMATISMOS'),
('R88', 'Outra lesão respiratória', 'RESPIRATÓRIO', 'TRAUMATISMOS'),
('R89', 'Malformação congênita do aparelho respiratório', 'RESPIRATÓRIO', 'ANOMALIAS CONGÊNITAS'),
('R90', 'Hipertrofia das amígdalas/adenóides', 'RESPIRATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('R92', 'Neoplasia respiratória NE', 'RESPIRATÓRIO', 'NEOPLASIAS'),
('R95', 'Doença pulmonar obstrutiva crônica', 'RESPIRATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('R96', 'Asma', 'RESPIRATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('R97', 'Rinite alérgica', 'RESPIRATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('R98', 'Síndrome de hiperventilação', 'RESPIRATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('R99', 'Outras doenças respiratórias', 'RESPIRATÓRIO', 'OUTROS DIAGNÓSTICOS'),
('S01', 'Dor/sensibilidade dolorosa da pele', 'PELE', 'SINAIS/SINTOMAS'),
('S02', 'Prurido', 'PELE', 'SINAIS/SINTOMAS'),
('S03', 'Verrugas', 'PELE', 'INFECÇÕES'),
('S04', 'Tumor/inchaço localizado', 'PELE', 'SINAIS/SINTOMAS'),
('S05', 'Tumores/inchaços generalizados', 'PELE', 'SINAIS/SINTOMAS'),
('S06', 'Erupção cutânea localizada', 'PELE', 'SINAIS/SINTOMAS'),
('S07', 'Erupção cutânea generalizada', 'PELE', 'SINAIS/SINTOMAS'),
('S08', 'Alterações da cor da pele', 'PELE', 'INFECÇÕES'),
('S09', 'Infecção dos dedos das mãos/pés', 'PELE', 'INFECÇÕES'),
('S10', 'Furúnculo/carbúnculo', 'PELE', 'INFECÇÕES'),
('S11', 'Infecção pós-traumática da pele', 'PELE', 'INFECÇÕES'),
('S12', 'Picada ou mordedura de inseto', 'PELE', 'TRAUMATISMOS'),
('S13', 'Mordedura animal/humana', 'PELE', 'TRAUMATISMOS'),
('S14', 'Queimadura/escaldão', 'PELE', 'TRAUMATISMOS'),
('S15', 'Corpo estranho na pele', 'PELE', 'TRAUMATISMOS'),
('S16', 'Traumatismo/contusão', 'PELE', 'TRAUMATISMOS'),
('S17', 'Abrasão/arranhão/bolhas', 'PELE', 'TRAUMATISMOS'),
('S18', 'Laceração/corte', 'PELE', 'TRAUMATISMOS'),
('S19', 'Outra lesão cutânea', 'PELE', 'TRAUMATISMOS'),
('S20', 'Calos/calosidades', 'PELE', 'SINAIS/SINTOMAS'),
('S21', 'Sinais/sintomas da textura da pele', 'PELE', 'SINAIS/SINTOMAS'),
('S22', 'Sinais/sintomas das unhas', 'PELE', 'SINAIS/SINTOMAS'),
('S23', 'Queda de cabelo/calvície', 'PELE', 'SINAIS/SINTOMAS'),
('S24', 'Sinais/sintomas do cabelo/couro cabeludo', 'PELE', 'SINAIS/SINTOMAS'),
('S26', 'Medo de câncer de pele', 'PELE', 'SINAIS/SINTOMAS'),
('S27', 'Medo de outra doença da pele', 'PELE', 'SINAIS/SINTOMAS'),
('S28', 'Limitação funcional/incapacidade', 'PELE', 'SINAIS/SINTOMAS'),
('S29', 'Sinais/sintomas da pele, outros', 'PELE', 'SINAIS/SINTOMAS'),
('S70', 'Herpes zoster', 'PELE', 'INFECÇÕES'),
('S71', 'Herpes simples', 'PELE', 'INFECÇÕES'),
('S72', 'Escabiose/outras acaríases', 'PELE', 'INFECÇÕES'),
('S73', 'Pediculose/outras infecções da pele', 'PELE', 'INFECÇÕES'),
('S74', 'Dermatofitose', 'PELE', 'INFECÇÕES'),
('S75', 'Monilíase oral/candidíase na pele', 'PELE', 'INFECÇÕES'),
('S76', 'Outras infecções da pele', 'PELE', 'INFECÇÕES'),
('S77', 'Neoplasias malignas da pele', 'PELE', 'NEOPLASIAS'),
('S78', 'Lipoma', 'PELE', 'NEOPLASIAS'),
('S79', 'Neoplasia cutânea benigna/incerta', 'PELE', 'NEOPLASIAS'),
('S80', 'Ceratose/ Queratose solar/queimadura solar', 'PELE', 'NEOPLASIAS'),
('S81', 'Hemangioma/linfangioma', 'PELE', 'ANOMALIAS CONGÊNITAS'),
('S82', 'Nevos/sinais da pele', 'PELE', 'ANOMALIAS CONGÊNITAS'),
('S83', 'Lesões da pele congênitas, outras', 'PELE', 'ANOMALIAS CONGÊNITAS'),
('S84', 'Impetigo', 'PELE', 'INFECÇÕES'),
('S85', 'Cisto pilonidal/fistula', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S86', 'Dermatite seborréica', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S87', 'Dermatite/eczema atópico', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S88', 'Dermatite de contato/alérgica', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S89', 'Dermatite das fraldas', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S90', 'Pitiríase rosada', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S91', 'Psoríase', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S92', 'Doença das glândulas sudoríparas', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S93', 'Cisto sebáceo', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S94', 'Unha encravada', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S95', 'Molusco contagioso', 'PELE', 'INFECÇÕES'),
('S96', 'Acne', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S97', 'Úlcera crônica da pele', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S98', 'Urticária', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('S99', 'Outras doenças da pele', 'PELE', 'OUTROS DIAGNÓSTICOS'),
('T01', 'Sede excessiva', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T02', 'Apetite excessivo', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T03', 'Perda de apetite', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T04', 'Problemas alimentares de lactente/criança', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T05', 'Problemas alimentares do adulto', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T07', 'Aumento de peso', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T08', 'Perda de peso', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T10', 'Atraso do crescimento', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T11', 'Desidratação', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T26', 'Medo de câncer do sistema endócrino', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T27', 'Medo de outra doença endócrina/metabólica', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T28', 'Limitação funcional/incapacidade', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T29', 'Sinais/sintomas endocrinológicos/metabólicos/nutricionais, outros', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'SINAIS/SINTOMAS'),
('T70', 'Infecção endócrina', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'INFECÇÕES'),
('T71', 'Neoplasia maligna da tiroide', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'NEOPLASIAS'),
('T72', 'Neoplasia benigna da tiroide', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'NEOPLASIAS'),
('T73', 'Outra neoplasia endócrina NE', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'NEOPLASIAS'),
('T78', 'Cisto do canal tiroglosso', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'ANOMALIAS CONGÊNITAS'),
('T80', 'Malformação congénita endócrina/metabólica', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'ANOMALIAS CONGÊNITAS'),
('T81', 'Bócio', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('T82', 'Obesidade', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('T83', 'Excesso de peso', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('T85', 'Hipertiroidismo/tireotoxicose', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('T86', 'Hipotiroidismo/mixedema', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('T87', 'Hipoglicemia', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('T89', 'Diabetes insulino-dependente', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('T90', 'Diabetes não insulino-dependente', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('T92', 'Gota', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('T93', 'Alteração no metabolismo dos lipídios', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('T99', 'Outras doenças endocrinológica/metabólica/nutricionais', 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 'OUTROS DIAGNÓSTICOS'),
('U01', 'Disúria/micção dolorosa', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U02', 'Micção frequente/urgência urinária/polaciúria', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U04', 'Incontinência urinária', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U05', 'Outros problemas com a micção', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U06', 'Hematúria', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U07', 'Outros sinais/sintomas urinários', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U08', 'Retenção urinária', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U13', 'Sinais/sintomas da bexiga, outros', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U14', 'Sinais/sintomas dos rins', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U26', 'Medo de câncer no aparelho urinário', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U27', 'Medo de outra doença urinária', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U28', 'Limitação funcional/incapacidade', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U29', 'Sinais/sintomas aparelho urinário, outros', 'URINÁRIO', 'SINAIS/SINTOMAS'),
('U70', 'Pielonefrite', 'URINÁRIO', 'INFECÇÕES'),
('U71', 'Cistite/outra infecção urinária', 'URINÁRIO', 'INFECÇÕES'),
('U72', 'Uretrite', 'URINÁRIO', 'INFECÇÕES'),
('U75', 'Neoplasia maligna do rim', 'URINÁRIO', 'NEOPLASIAS'),
('U76', 'Neoplasia benigna do rim', 'URINÁRIO', 'NEOPLASIAS'),
('U77', 'Neoplasia maligna do aparelho urinário, outra', 'URINÁRIO', 'NEOPLASIAS'),
('U78', 'Neoplasia benigna do aparelho urinário', 'URINÁRIO', 'NEOPLASIAS'),
('U79', 'Neoplasia do aparelho urinário NE', 'URINÁRIO', 'NEOPLASIAS'),
('U80', 'Lesões traumáticas do aparelho urinário', 'URINÁRIO', 'TRAUMATISMOS'),
('U85', 'Malformação congênita do aparelho urinário', 'URINÁRIO', 'ANOMALIAS CONGÊNITAS'),
('U88', 'Glomerulonefrite/síndrome nefrótica', 'URINÁRIO', 'OUTROS DIAGNÓSTICOS'),
('U90', 'Albuminúria/proteinúria ortostática', 'URINÁRIO', 'OUTROS DIAGNÓSTICOS'),
('U95', 'Cálculo urinário', 'URINÁRIO', 'OUTROS DIAGNÓSTICOS'),
('U98', 'Análise de urina anormal NE', 'URINÁRIO', 'OUTROS DIAGNÓSTICOS'),
('U99', 'Outras doenças urinárias', 'URINÁRIO', 'OUTROS DIAGNÓSTICOS'),
('W01', 'Questão sobre gravidez', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W02', 'Medo de estar grávida', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W03', 'Hemorrhagia antes do parto', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W05', 'Vômitos/náuseas durante a gravidez', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W10', 'Contracepção pós-coital', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W11', 'Contracepção oral', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W12', 'Contracepção intra-uterina/Dispositivo Intrauterino/DIU', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W13', 'Esterilização', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W14', 'Contracepção/outros', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W15', 'Infertilidade/subfertildade', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W17', 'Hemorrhagia pós-parto', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W18', 'Sinais/sintomas pós-parto', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W19', 'Sinais/sintomas da mama/lactação', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W21', 'Preocupação com a imagem corporal na gravidez', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W27', 'Medo de complicações na gravidez', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W28', 'Limitação funcional/incapacidade', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W29', 'Sinais/sintomas da gravidez, outros', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'SINAIS/SINTOMAS'),
('W70', 'Sepsis/infecção puerperal', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'INFECÇÕES'),
('W71', 'Infecções que complicam a gravidez', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'INFECÇÕES'),
('W72', 'Neoplasia maligna relacionada com gravidez', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'NEOPLASIAS'),
('W73', 'Neoplasia benigna/incerta relacionada com a gravidez', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'NEOPLASIAS'),
('W75', 'Lesões traumáticas que complicam a gravidez', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'TRAUMATISMOS'),
('W76', 'Malformação congénita que complica a gravidez', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'ANOMALIAS CONGÊNITAS'),
('W78', 'Gravidez', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W79', 'Gravidez não desejada', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W80', 'Gravidez ectópica', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W81', 'Toxemia gravídica/DHEG', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W82', 'Aborto espontâneo', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W83', 'Aborto provocado', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W84', 'Gravidez de alto risco', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W85', 'Diabetes gestacional', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W90', 'Parto sem complicações de nascido vivo', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W91', 'Parto sem complicações de natimorto', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W92', 'Parto com complicações de nascido vivo', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W93', 'Parto com complicações de natimorto', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W94', 'Mastite puerperal', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W95', 'Outros problemas da mama durante gravidez/puerpério', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W96', 'Outras complicações do puerpério', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('W99', 'Outros problemas da gravidez/parto', 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 'OUTROS DIAGNÓSTICOS'),
('X01', 'Dor genital', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X02', 'Dores menstruais', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X03', 'Dores intermenstruais', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X04', 'Relação sexual dolorosa na mulher', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X05', 'Menstruação escassa/ausente', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X06', 'Menstruação excessiva', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X07', 'Menstruação irregular/frequente', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X08', 'Hemorrhagia intermenstrual', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X09', 'Sinais/sintomas pré-menstruais', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X10', 'Desejo de alterar a data menstruação', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X11', 'Sinais/sintomas da menopausa/climatério', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X12', 'Hemorrhagia pós-menopausa', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X13', 'Hemorrhagia pós-coital', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X14', 'Secreção vaginal', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X15', 'Sinais/sintomas da vagina', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X16', 'Sinais/sintomas da vulva', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X17', 'Sinais/sintomas da pélvis feminina', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X18', 'Dor na mama feminina', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X19', 'Tumor ou nódulo na mama feminina', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X20', 'Sinais/sintomas do mamilo da mulher', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X21', 'Sinais/sintomas da mama feminina, outros', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X22', 'Preocupação com a aparência da mama feminina', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X23', 'Medo de doença de transmissão sexual', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X24', 'Medo de disfunção sexual', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X25', 'Medo de câncer genital', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X26', 'Medo de câncer na mama', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X27', 'Medo de outra doença genital/mama', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X28', 'Limitação funcional/incapacidade', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X29', 'Sinais/sintomas do aparelho genital feminino, outra', 'GENITAL FEMININO', 'SINAIS/SINTOMAS'),
('X70', 'Sífilis feminina', 'GENITAL FEMININO', 'INFECÇÕES'),
('X71', 'Gonorréia feminina', 'GENITAL FEMININO', 'INFECÇÕES'),
('X72', 'Candidíase genital feminina', 'GENITAL FEMININO', 'INFECÇÕES'),
('X73', 'Tricomoníase genital feminina', 'GENITAL FEMININO', 'INFECÇÕES'),
('X74', 'Doença inflamatória pélvica', 'GENITAL FEMININO', 'INFECÇÕES'),
('X75', 'Neoplasia maligna do colo', 'GENITAL FEMININO', 'NEOPLASIAS'),
('X76', 'Neoplasia maligna da mama feminina', 'GENITAL FEMININO', 'NEOPLASIAS'),
('X77', 'Neoplasia maligna genital feminina, outra', 'GENITAL FEMININO', 'NEOPLASIAS'),
('X78', 'Fibromioma uterino', 'GENITAL FEMININO', 'NEOPLASIAS'),
('X79', 'Neoplasia benigna da mama feminina/fibroadenoma', 'GENITAL FEMININO', 'NEOPLASIAS'),
('X80', 'Neoplasia benigna genital', 'GENITAL FEMININO', 'NEOPLASIAS'),
('X81', 'Neoplasia genital feminina, outra/NE', 'GENITAL FEMININO', 'NEOPLASIAS'),
('X82', 'Lesão traumática genital feminina', 'GENITAL FEMININO', 'TRAUMATISMOS'),
('X83', 'Malformações congênitas genitais', 'GENITAL FEMININO', 'ANOMALIAS CONGÊNITAS');
INSERT INTO `grupo_ciap` (`codigo`, `enfermidade`, `componente`, `caso_clinico`) VALUES
('X84', 'Vaginite/vulvite NE', 'GENITAL FEMININO', 'OUTROS DIAGNÓSTICOS'),
('X85', 'Doença do colo NE', 'GENITAL FEMININO', 'OUTROS DIAGNÓSTICOS'),
('X86', 'Esfregaço de Papanicolau/colpocitologia oncótica anormal', 'GENITAL FEMININO', 'OUTROS DIAGNÓSTICOS'),
('X87', 'Prolapso utero-vaginal', 'GENITAL FEMININO', 'OUTROS DIAGNÓSTICOS'),
('X88', 'Doença fibrocística da mama', 'GENITAL FEMININO', 'OUTROS DIAGNÓSTICOS'),
('X89', 'Síndrome da tensão pré-menstrual', 'GENITAL FEMININO', 'OUTROS DIAGNÓSTICOS'),
('X90', 'Herpes genital feminino', 'GENITAL FEMININO', 'INFECÇÕES'),
('X91', 'Condiloma acuminado feminino', 'GENITAL FEMININO', 'INFECÇÕES'),
('X92', 'Infecção por clamídia', 'GENITAL FEMININO', 'INFECÇÕES'),
('X99', 'Doença genital feminina, outra', 'GENITAL FEMININO', 'OUTROS DIAGNÓSTICOS'),
('Y01', 'Dor no pênis', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y02', 'Dor no escroto/testículos', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y03', 'Secreção uretral', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y04', 'Sinais/sintomas do pênis, outros', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y05', 'Sinais/sintomas do escroto/testículos, outros', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y06', 'Sinais/sintomas da próstata', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y07', 'Impotência NE', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y08', 'Sinais/sintomas da função sexual masculina, outros', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y10', 'Infertilidade/subfertildade masculina', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y13', 'Esterilização masculina', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y14', 'Planejamento familiar, outros', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y16', 'Sinais/sintomas da mama masculina', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y24', 'Medo de disfunção sexual masculina', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y25', 'Medo de doença sexualmente transmissível', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y26', 'Medo de câncer genital masculino', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y27', 'Medo de doença genital masculina, outra', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y28', 'Limitação funcional/incapacidade', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y29', 'Sinais/sintomas, outros', 'GENITAL MASCULINO', 'SINAIS/SINTOMAS'),
('Y70', 'Sífilis masculina', 'GENITAL MASCULINO', 'INFECÇÕES'),
('Y71', 'Gonorréia masculina', 'GENITAL MASCULINO', 'INFECÇÕES'),
('Y72', 'Herpes genital', 'GENITAL MASCULINO', 'INFECÇÕES'),
('Y73', 'Prostatite/vesiculite seminal', 'GENITAL MASCULINO', 'INFECÇÕES'),
('Y74', 'Orquite/epididimite', 'GENITAL MASCULINO', 'INFECÇÕES'),
('Y75', 'Balanite/Balanopostite', 'GENITAL MASCULINO', 'INFECÇÕES'),
('Y76', 'Condiloma acuminado', 'GENITAL MASCULINO', 'INFECÇÕES'),
('Y77', 'Neoplasia maligna da próstata', 'GENITAL MASCULINO', 'NEOPLASIAS'),
('Y78', 'Neoplasia maligna genital masculina, outra', 'GENITAL MASCULINO', 'NEOPLASIAS'),
('Y79', 'Neoplasia benigna genital masculina NE', 'GENITAL MASCULINO', 'NEOPLASIAS'),
('Y80', 'Traumatismo genital masculino, outro', 'GENITAL MASCULINO', 'TRAUMATISMOS'),
('Y81', 'Fimose/prepúcio redundante', 'GENITAL MASCULINO', 'ANOMALIAS CONGÊNITAS'),
('Y82', 'Hypospádias', 'GENITAL MASCULINO', 'ANOMALIAS CONGÊNITAS'),
('Y83', 'Testículo não descido/Criptorquidia/Testículo ectópico', 'GENITAL MASCULINO', 'ANOMALIAS CONGÊNITAS'),
('Y84', 'Malformação genital congênita masculina, outra', 'GENITAL MASCULINO', 'ANOMALIAS CONGÊNITAS'),
('Y85', 'Hipertrofia benigna da próstata/hiperplasia prostática benigna', 'GENITAL MASCULINO', 'OUTROS DIAGNÓSTICOS'),
('Y86', 'Hidrocele', 'GENITAL MASCULINO', 'OUTROS DIAGNÓSTICOS'),
('Y99', 'Doença genital masculina, outra', 'GENITAL MASCULINO', 'OUTROS DIAGNÓSTICOS'),
('Z01', 'Pobreza/problemas econômicos', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z02', 'Problemas relacionados a água/alimentação', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z03', 'Problemas de habitação/vizinhança', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z04', 'Problema socio-cultural', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z05', 'Problemas com condições de trabalho', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z06', 'Problemas de desemprego', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z07', 'Problemas relacionados com educação', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z08', 'Problema relacionado com sistema de segurança social', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z09', 'Problema de ordem legal', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z10', 'Problema relacionado com sistema de saúde', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z11', 'Problema relacionado com estar doente', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z12', 'Problema de relacionamento com parceiro/conjugal', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z13', 'Problema comportamental do parceiro/companheiro', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z14', 'Problema por doença do parceiro/companheiro', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z15', 'Perda ou falecimento do parceiro/companheiro', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z16', 'Problema de relacionamento com criança', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z18', 'Problema com criança doente', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z19', 'Perda ou falecimento de criança', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z20', 'Problema de relacionamento com familiares', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z21', 'Problema comportamental de familiar', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z22', 'Problema por doença familiar', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z23', 'Perda/falecimento de familiar', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z24', 'Problema de relacionamento com amigos', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z25', 'Ato ou acontecimento violento', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z27', 'Medo de problema social', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z28', 'Limitação funcional/incapacidade', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS'),
('Z29', 'Problema social NE', 'PROBLEMAS SOCIAIS', 'SINAIS/SINTOMAS');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pessoa`
--

CREATE TABLE `Pessoa` (
  `IdPessoa` int(10) UNSIGNED NOT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `Nome` varchar(150) DEFAULT NULL,
  `Telefone` varchar(14) DEFAULT NULL,
  `Cargo` varchar(80) DEFAULT NULL,
  `Empresa` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Senha` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `Pessoa`
--

INSERT INTO `Pessoa` (`IdPessoa`, `CPF`, `Nome`, `Telefone`, `Cargo`, `Empresa`, `Email`, `Senha`) VALUES
(1, NULL, 'Administrador', NULL, 'Admin', NULL, 'admin@protege.com', 'admin123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Procedimentoclinico`
--

CREATE TABLE `Procedimentoclinico` (
  `IdProcedimento` int(10) UNSIGNED NOT NULL,
  `Descricao` varchar(200) DEFAULT NULL,
  `IdEnfermidade_FK` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `Procedimentoclinico`
--

INSERT INTO `Procedimentoclinico` (`IdProcedimento`, `Descricao`, `IdEnfermidade_FK`) VALUES
(1, 'GERAL E INESPECÍFICO', 1),
(2, 'SANGUE, SISTEMA HEMATOPOIÉTICO, LINFÁTICO E BAÇO', 1),
(3, 'DIGESTIVO', 1),
(4, 'OLHO', 1),
(5, 'OUVIDO', 1),
(6, 'CIRCULATÓRIO', 1),
(7, 'MÚSCULO-ESQUELÉTICO', 1),
(8, 'NEUROLÓGICO', 1),
(9, 'PSICOLÓGICO', 1),
(10, 'RESPIRATÓRIO', 1),
(11, 'PELE', 1),
(12, 'ENDÓCRINO/METABÓLICO E NUTRICIONAL', 1),
(13, 'URINÁRIO', 1),
(14, 'GRAVIDEZ, PARTO E PLANEJAMENTO FAMILIAR', 1),
(15, 'GENITAL FEMININO', 1),
(16, 'GENITAL MASCULINO', 1),
(17, 'PROBLEMAS SOCIAIS', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Questao_Questionario`
--

CREATE TABLE `Questao_Questionario` (
  `IdQuestao` int(10) UNSIGNED NOT NULL,
  `Descricao` varchar(250) DEFAULT NULL,
  `Tematica` varchar(120) DEFAULT NULL,
  `IdPessoa_FK` int(10) UNSIGNED DEFAULT NULL,
  `IdProcedimento_FK` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Resposta_Questionario`
--

CREATE TABLE `Resposta_Questionario` (
  `IdResposta` int(10) UNSIGNED NOT NULL,
  `Descricao` varchar(200) DEFAULT NULL,
  `Correta` varchar(1) DEFAULT NULL,
  `IdQuestao_FK` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Sintoma_Enfermidade`
--

CREATE TABLE `Sintoma_Enfermidade` (
  `IdSintoma` int(10) UNSIGNED NOT NULL,
  `Descricao` text DEFAULT NULL,
  `IdEnfermida_FK` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Telefonesuteis`
--

CREATE TABLE `Telefonesuteis` (
  `IdTelefone` int(10) UNSIGNED NOT NULL,
  `Numero` varchar(14) DEFAULT NULL,
  `Unidadesaude` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `Caso_Clinico`
--
ALTER TABLE `Caso_Clinico`
  ADD PRIMARY KEY (`IdCaso`),
  ADD KEY `IdEnfermidade_FK` (`IdEnfermidade_FK`);

--
-- Índices de tabela `Enfermidade`
--
ALTER TABLE `Enfermidade`
  ADD PRIMARY KEY (`IdEnfermidade`),
  ADD UNIQUE KEY `CID10_UNIQUE` (`CID10`);

--
-- Índices de tabela `Pessoa`
--
ALTER TABLE `Pessoa`
  ADD PRIMARY KEY (`IdPessoa`);

--
-- Índices de tabela `Procedimentoclinico`
--
ALTER TABLE `Procedimentoclinico`
  ADD PRIMARY KEY (`IdProcedimento`),
  ADD KEY `IdEnfermidade_FK` (`IdEnfermidade_FK`);

--
-- Índices de tabela `Questao_Questionario`
--
ALTER TABLE `Questao_Questionario`
  ADD PRIMARY KEY (`IdQuestao`),
  ADD KEY `IdPessoa_FK` (`IdPessoa_FK`),
  ADD KEY `IdProcedimento_FK` (`IdProcedimento_FK`);

--
-- Índices de tabela `Resposta_Questionario`
--
ALTER TABLE `Resposta_Questionario`
  ADD PRIMARY KEY (`IdResposta`),
  ADD KEY `IdQuestao_FK` (`IdQuestao_FK`);

--
-- Índices de tabela `Sintoma_Enfermidade`
--
ALTER TABLE `Sintoma_Enfermidade`
  ADD PRIMARY KEY (`IdSintoma`),
  ADD KEY `IdEnfermida_FK` (`IdEnfermida_FK`);

--
-- Índices de tabela `Telefonesuteis`
--
ALTER TABLE `Telefonesuteis`
  ADD PRIMARY KEY (`IdTelefone`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Caso_Clinico`
--
ALTER TABLE `Caso_Clinico`
  MODIFY `IdCaso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Enfermidade`
--
ALTER TABLE `Enfermidade`
  MODIFY `IdEnfermidade` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1024;

--
-- AUTO_INCREMENT de tabela `Pessoa`
--
ALTER TABLE `Pessoa`
  MODIFY `IdPessoa` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `Procedimentoclinico`
--
ALTER TABLE `Procedimentoclinico`
  MODIFY `IdProcedimento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `Questao_Questionario`
--
ALTER TABLE `Questao_Questionario`
  MODIFY `IdQuestao` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Resposta_Questionario`
--
ALTER TABLE `Resposta_Questionario`
  MODIFY `IdResposta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Sintoma_Enfermidade`
--
ALTER TABLE `Sintoma_Enfermidade`
  MODIFY `IdSintoma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Telefonesuteis`
--
ALTER TABLE `Telefonesuteis`
  MODIFY `IdTelefone` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Caso_Clinico`
--
ALTER TABLE `Caso_Clinico`
  ADD CONSTRAINT `Caso_Clinico_ibfk_1` FOREIGN KEY (`IdEnfermidade_FK`) REFERENCES `Enfermidade` (`IdEnfermidade`);

--
-- Restrições para tabelas `Procedimentoclinico`
--
ALTER TABLE `Procedimentoclinico`
  ADD CONSTRAINT `Procedimentoclinico_ibfk_1` FOREIGN KEY (`IdEnfermidade_FK`) REFERENCES `Enfermidade` (`IdEnfermidade`);

--
-- Restrições para tabelas `Questao_Questionario`
--
ALTER TABLE `Questao_Questionario`
  ADD CONSTRAINT `Questao_Questionario_ibfk_1` FOREIGN KEY (`IdPessoa_FK`) REFERENCES `Pessoa` (`IdPessoa`),
  ADD CONSTRAINT `Questao_Questionario_ibfk_2` FOREIGN KEY (`IdProcedimento_FK`) REFERENCES `Procedimentoclinico` (`IdProcedimento`);

--
-- Restrições para tabelas `Resposta_Questionario`
--
ALTER TABLE `Resposta_Questionario`
  ADD CONSTRAINT `Resposta_Questionario_ibfk_1` FOREIGN KEY (`IdQuestao_FK`) REFERENCES `Questao_Questionario` (`IdQuestao`);

--
-- Restrições para tabelas `Sintoma_Enfermidade`
--
ALTER TABLE `Sintoma_Enfermidade`
  ADD CONSTRAINT `Sintoma_Enfermidade_ibfk_1` FOREIGN KEY (`IdEnfermida_FK`) REFERENCES `Enfermidade` (`IdEnfermidade`);
--
-- Banco de dados: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Recently accessed tables';

--
-- Despejando dados para a tabela `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"BD_PROTEGE_V5\",\"table\":\"procedimento_clinico\"},{\"db\":\"BD_PROTEGE_V5\",\"table\":\"caso_clinico\"},{\"db\":\"BD_PROTEGE_V5\",\"table\":\"grupo_ciap\"},{\"db\":\"BD_PROTEGE_V5\",\"table\":\"Enfermidade\"}]');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Despejando dados para a tabela `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-10-28 19:09:20', '{\"lang\":\"pt_BR\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estrutura para tabela `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Índices de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Índices de tabela `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Índices de tabela `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Índices de tabela `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Índices de tabela `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Índices de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Índices de tabela `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Índices de tabela `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Índices de tabela `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Índices de tabela `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Índices de tabela `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Índices de tabela `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Índices de tabela `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
