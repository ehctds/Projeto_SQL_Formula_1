CREATE TABLE tb_pais(
    id_pais  VARCHAR(3) NOT NULL,
    nm_pais  VARCHAR(50) NOT NULL,
    nr_populacao int,
    PRIMARY KEY(id_pais)
);

CREATE TABLE tb_equipe(
    id_equip int,
    nm_equip VARCHAR(50) NOT NULL,
    id_pais  VARCHAR(3) NOT NULL,
    PRIMARY KEY(id_equip),
    FOREIGN KEY(id_pais) REFERENCES tb_pais(id_pais)
);

CREATE TABLE tb_piloto(
    id_piloto int,
    nm_piloto VARCHAR(50) NOT NULL,
    dt_nascimento DATE NOT NULL,
    id_pais  VARCHAR(3) NOT NULL,
    id_equip int,
    PRIMARY KEY(id_piloto),
    FOREIGN KEY(id_pais) REFERENCES tb_pais(id_pais),
    FOREIGN KEY(id_equip) REFERENCES tb_equipe(id_equip)
);
--
CREATE TABLE tb_circuito(
    id_circuito int,
    nm_circuito VARCHAR(50) NOT NULL,
    nr_extensao int,
    id_pais     VARCHAR(3) NOT NULL,
    PRIMARY KEY(id_circuito),
    FOREIGN KEY(id_pais) REFERENCES tb_pais(id_pais)
);
--
CREATE TABLE tb_prova(
    id_prova int,
    dt_prova  date,
    nm_situacao VARCHAR(50) NOT NULL,
    id_circuito int,
    PRIMARY KEY(id_prova),
    FOREIGN KEY(id_circuito) REFERENCES tb_circuito(id_circuito)
);
--
CREATE TABLE tb_resultado(
    id_prova  int,
    id_piloto int,
    nr_tempo_prova VARCHAR(20),
    nr_colocacao_final int,
    nr_posicao_grid int,
    nr_melhor_volta int,
    FOREIGN KEY(id_prova) REFERENCES tb_prova(id_prova),
    FOREIGN KEY(id_piloto) REFERENCES tb_piloto(id_piloto)
);