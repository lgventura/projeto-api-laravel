-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Nov-2019 às 04:05
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `send4`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

CREATE TABLE `contatos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(60) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `contatos`
--

INSERT INTO `contatos` (`id`, `nome`, `sobrenome`, `email`, `telefone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Luiz', 'Gustavo Ventura', 'luizgventura@hotmail.com', '43996417713', '2019-11-28 04:08:39', '2019-11-28 04:21:49', NULL),
(2, 'Gustavo', 'Luiz Ventura', 'luizventura.lg55@gmail.com', '43996417713', '2019-11-28 04:29:23', '2019-11-28 04:29:23', NULL),
(3, 'Teste', 'Contato', 'teste@teste.com', '41999999999', '2019-11-30 04:28:29', '2019-11-30 04:28:29', NULL),
(4, 'Contato', 'Teste', 'teste@teste.com', '(41)9 4745-4545', '2019-11-30 04:43:40', '2019-11-30 04:43:40', NULL),
(5, 'Teste3', 'Contato2', 'teste@teste.com', '41999999999', '2019-11-30 04:47:39', '2019-11-30 05:07:19', NULL),
(7, 'Teste4', 'Contato2', 'teste@teste.com', '41999999999', '2019-11-30 04:54:01', '2019-11-30 04:54:05', '2019-11-30 04:54:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagens`
--

CREATE TABLE `mensagens` (
  `id` int(11) NOT NULL,
  `descricao` longtext NOT NULL,
  `contatos_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `mensagens`
--

INSERT INTO `mensagens` (`id`, `descricao`, `contatos_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mensagem de Teste', 1, '2019-11-28 04:15:05', '2019-11-28 04:15:05', NULL),
(2, 'Mensag Teste 2', 1, '2019-11-29 05:14:30', '2019-11-29 05:14:30', NULL),
(3, 'Mensag Teste 3', 2, '2019-11-29 05:14:45', '2019-11-29 05:14:45', NULL),
(4, 'Mensag Teste 4', 1, '2019-11-29 05:17:15', '2019-11-29 05:17:15', NULL),
(5, 'Mensagem de teste para o contato 3', 5, '2019-11-30 05:45:49', '2019-11-30 05:47:57', '2019-11-30 05:47:57');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_mensagens_contatos_idx` (`contatos_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `contatos`
--
ALTER TABLE `contatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `mensagens`
--
ALTER TABLE `mensagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `mensagens`
--
ALTER TABLE `mensagens`
  ADD CONSTRAINT `fk_mensagens_contatos` FOREIGN KEY (`contatos_id`) REFERENCES `contatos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
