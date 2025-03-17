package com.isced.tropiko.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.Instant;

@Entity
@Table(name = "carrinho")
public class Carrinho {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "fruta_id", nullable = false)
    private Fruta fruta;

    @Column(name = "quantidade", nullable = false)
    private Integer quantidade;

    @ColumnDefault("current_timestamp()")
    @Column(name = "data_adicao", nullable = false)
    private Instant dataAdicao;

    @PrePersist
    protected void onCreate() {
        if (this.dataAdicao == null) {
            this.dataAdicao = Instant.now();
        }
    }

    public Carrinho() {
    }

    public Carrinho(Integer id, Usuario usuario, Fruta fruta, Integer quantidade, Instant dataAdicao) {
        this.id = id;
        this.usuario = usuario;
        this.fruta = fruta;
        this.quantidade = quantidade;
        this.dataAdicao = dataAdicao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Fruta getFruta() {
        return fruta;
    }

    public void setFruta(Fruta fruta) {
        this.fruta = fruta;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public Instant getDataAdicao() {
        return dataAdicao;
    }

    public void setDataAdicao(Instant dataAdicao) {
        this.dataAdicao = dataAdicao;
    }

}