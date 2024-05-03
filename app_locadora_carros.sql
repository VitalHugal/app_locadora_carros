-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Maio-2024 às 14:29
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `app_locadora_carros`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('3nD8KswuKwPoc0Yo', 's:7:\"forever\";', 2029860435),
('3TjJlhJtFFl8rMEO', 's:7:\"forever\";', 2029860310),
('4hCFuHSBzCnSHCBG', 's:7:\"forever\";', 2029859832),
('aoxAnuqBTXEVgs5e', 's:7:\"forever\";', 2029871120),
('APHuFh6C6sKYaleM', 's:7:\"forever\";', 2029868339),
('b0K69o7SXHTed3f0', 's:7:\"forever\";', 2029867127),
('fpYaoMjgUkiALOCu', 's:7:\"forever\";', 2029867225),
('gm9K5Cjp7fVhgkGb', 's:7:\"forever\";', 2029867814),
('o5LjpcXsOoOSYSz8', 's:7:\"forever\";', 2030115445),
('Pbqo2TqA9v033Fbu', 's:7:\"forever\";', 2030037956),
('PpD94rjPzRSJ4YJ5', 's:7:\"forever\";', 2029870527),
('qzCkVTZmt14t0Ecc', 's:7:\"forever\";', 2029860536),
('RLQxMGn2L7vLDPBJ', 's:7:\"forever\";', 2029868079),
('tfPhZxc3dYWCXGJE', 's:7:\"forever\";', 2029869499),
('VNeTnAb115nGvGIo', 's:7:\"forever\";', 2029864273);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carros`
--

CREATE TABLE `carros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modelo_id` bigint(20) UNSIGNED NOT NULL,
  `placa` varchar(10) NOT NULL,
  `disponivel` tinyint(1) NOT NULL,
  `km` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `carros`
--

INSERT INTO `carros` (`id`, `modelo_id`, `placa`, `disponivel`, `km`, `created_at`, `updated_at`) VALUES
(5, 8, 'EFG5678', 1, 3000, '2024-05-02 19:13:10', '2024-05-02 20:33:58'),
(7, 12, 'VHJ2505', 1, 159780, '2024-05-02 20:32:15', '2024-05-02 20:32:15'),
(8, 9, 'ASS3000', 0, 300320, '2024-05-02 20:32:40', '2024-05-02 20:33:34'),
(9, 9, 'GBA1608', 0, 195875, '2024-05-02 20:33:18', '2024-05-02 20:33:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(5, 'Lucas Silva', '2024-05-02 14:08:08', '2024-05-02 17:51:00'),
(7, 'Arianne Soares', '2024-05-02 17:24:35', '2024-05-02 17:24:35'),
(9, 'Pablo Vitar', '2024-05-02 17:53:51', '2024-05-02 17:53:51'),
(10, 'Messi Ronaldo', '2024-05-02 17:54:40', '2024-05-02 17:54:40'),
(11, 'Cristiano Messi', '2024-05-02 17:54:52', '2024-05-02 17:54:52');

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `locacoes`
--

CREATE TABLE `locacoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED NOT NULL,
  `carro_id` bigint(20) UNSIGNED NOT NULL,
  `data_inicio_periodo` datetime NOT NULL,
  `data_final_previsto_periodo` datetime NOT NULL,
  `data_final_realizado_periodo` datetime NOT NULL,
  `valor_diaria` float NOT NULL,
  `km_inicial` int(11) NOT NULL,
  `km_final` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `locacoes`
--

INSERT INTO `locacoes` (`id`, `cliente_id`, `carro_id`, `data_inicio_periodo`, `data_final_previsto_periodo`, `data_final_realizado_periodo`, `valor_diaria`, `km_inicial`, `km_final`, `created_at`, `updated_at`) VALUES
(2, 7, 5, '2024-05-05 00:00:00', '2024-05-06 00:00:00', '2024-05-06 00:00:00', 199.9, 3000, 3150, '2024-05-03 14:46:57', '2024-05-03 14:46:57'),
(3, 11, 5, '2024-05-05 00:00:00', '2024-05-08 00:00:00', '2024-05-12 00:00:00', 199.9, 3500, 4123, '2024-05-03 14:48:08', '2024-05-03 14:48:08'),
(4, 9, 8, '2024-05-20 00:00:00', '2024-05-22 00:00:00', '2024-05-29 00:00:00', 280, 5000, 6000, '2024-05-03 15:14:12', '2024-05-03 15:14:12'),
(5, 10, 8, '2024-06-24 00:00:00', '2024-06-25 00:00:00', '2024-05-25 00:00:00', 180, 6570, 6987, '2024-05-03 15:15:11', '2024-05-03 15:15:11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE `marcas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `imagem` varchar(100) NOT NULL COMMENT 'Logo da marca',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`id`, `nome`, `imagem`, `created_at`, `updated_at`) VALUES
(29, 'BMW', 'imagens/KZYdAn923lzyw3srUfzLMGG0Scqc5sRbX9IaTxaX.png', '2024-04-26 21:39:09', '2024-05-02 17:56:48'),
(30, 'volksvagem', 'imagens/ev2qw5awvjRckYsujNoHMlxdyJGxfEKGF7TEQCsg.png', '2024-04-26 21:39:51', '2024-04-29 23:52:49'),
(33, 'Kia', 'imagens/rrNipt5XFQXNhABuq86SsRGWybYccpf9YRQVmwHs.png', '2024-04-30 16:39:10', '2024-04-30 16:39:10'),
(46, 'Honda', 'imagens/hpeQFyuSgisVtD63l3AR4W8kFGlxqtg61X7J1ffG.png', '2024-05-02 14:20:09', '2024-05-02 14:20:09'),
(47, 'Nissan', 'imagens/rAKvUuOroHVp759kawUkKRZvl6XI3XrxNmRaEXDI.png', '2024-05-02 17:55:35', '2024-05-02 17:55:35'),
(48, 'Hyundai', 'imagens/sMhGm28cTUTt57UsLI7wVJLxSIAyk0UT5NvuQppx.png', '2024-05-02 18:06:22', '2024-05-02 18:06:22'),
(49, 'Ford', 'imagens/60UgGbnD9lshg7y3Su9Q377WcHRmo5ZHc9lqqv8F.png', '2024-05-02 18:43:47', '2024-05-02 18:43:47');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_04_17_200331_add_two_factor_columns_to_users_table', 1),
(5, '2024_04_17_200358_create_personal_access_tokens_table', 1),
(6, '2024_04_17_200921_create_marcas_table', 2),
(7, '2024_04_17_201923_create_modelos_table', 2),
(8, '2024_04_17_202156_create_carros_table', 2),
(9, '2024_04_17_202412_create_clientes_table', 2),
(10, '2024_04_17_202429_create_locacoes_table', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelos`
--

CREATE TABLE `modelos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `marca_id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(30) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `numero_portas` int(11) NOT NULL,
  `lugares` int(11) NOT NULL,
  `air_bag` tinyint(1) NOT NULL,
  `abs` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `modelos`
--

INSERT INTO `modelos` (`id`, `marca_id`, `nome`, `imagem`, `numero_portas`, `lugares`, `air_bag`, `abs`, `created_at`, `updated_at`) VALUES
(7, 30, 'GOL 1.0', 'imagens/modelos/iH9CUf8bSQLYkuqvRXEnicGm6ZCEH9qlcwZmBw6q.png', 4, 5, 1, 1, '2024-05-02 18:07:22', '2024-05-02 18:07:22'),
(8, 48, 'HB20', 'imagens/modelos/DqCN0tLmP2JTEHpJBCOV8SYg0IYMqfjuGaoZ4Gbq.png', 2, 5, 1, 0, '2024-05-02 18:08:58', '2024-05-02 18:08:58'),
(9, 48, 'HB20 - Sedan', 'imagens/modelos/mHyB4YIeUn5BaGDIzddB7xEKApZPOpYwZ9xaA0Vi.png', 4, 5, 1, 1, '2024-05-02 18:42:05', '2024-05-02 18:42:05'),
(10, 30, 'Polo 1.0', 'imagens/modelos/u79lvGKt8OWsTouDd7zWZvez27C4riGY8Oiiqrhr.png', 4, 5, 0, 0, '2024-05-02 18:43:05', '2024-05-02 18:43:05'),
(12, 49, 'Ford ka 1.0 Sedan', 'imagens/modelos/5BpR0lOjiVwAHYIfNWywxobtvDAFowEHAXX5viQB.png', 4, 5, 0, 0, '2024-05-02 18:44:48', '2024-05-02 18:44:48');

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rvizynVRRhGQJJkkgcJunDh6Mz7nVy1L1SHN0UBW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTlCeW1rOTk4NFF0VTJQZlBjSVlITXFMR1k2c014NG1rd1BGOWRvVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1714756955);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Jorge', 'jorge@teste.com', NULL, '$2y$12$T4/ZQX.p8BqgMPMp5H2CZ.s11bVwpxWRg8n3V83sI6jLEVJnyy6Bq', NULL, NULL, NULL, NULL, NULL, '2024-04-22 23:29:52', '2024-04-22 23:29:52'),
(2, 'Victor Hugo', 'victor@teste.com', NULL, '$2y$12$zMHLybY7g0mpm0S5gj2CrOsUJs.ULgKfty5Qak7RlGb8kuA.o45r6', NULL, NULL, NULL, NULL, NULL, '2024-04-23 21:44:16', '2024-04-23 21:44:16');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Índices para tabela `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Índices para tabela `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carros_placa_unique` (`placa`),
  ADD KEY `carros_modelo_id_foreign` (`modelo_id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Índices para tabela `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `locacoes`
--
ALTER TABLE `locacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locacoes_cliente_id_foreign` (`cliente_id`),
  ADD KEY `locacoes_carro_id_foreign` (`carro_id`);

--
-- Índices para tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marcas_nome_unique` (`nome`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modelos_marca_id_foreign` (`marca_id`);

--
-- Índices para tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carros`
--
ALTER TABLE `carros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `locacoes`
--
ALTER TABLE `locacoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carros`
--
ALTER TABLE `carros`
  ADD CONSTRAINT `carros_modelo_id_foreign` FOREIGN KEY (`modelo_id`) REFERENCES `modelos` (`id`);

--
-- Limitadores para a tabela `locacoes`
--
ALTER TABLE `locacoes`
  ADD CONSTRAINT `locacoes_carro_id_foreign` FOREIGN KEY (`carro_id`) REFERENCES `carros` (`id`),
  ADD CONSTRAINT `locacoes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

--
-- Limitadores para a tabela `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `modelos_marca_id_foreign` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
