package com.isced.tropiko.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.Instant;

@Entity
@Table(name = "vendas")
public class Venda {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    @ColumnDefault("current_timestamp()")
    @Column(name = "data_venda", nullable = false)
    private Instant dataVenda;

    @Column(name = "total", nullable = false, precision = 10, scale = 2)
    private BigDecimal total;

    @ColumnDefault("'PENDENTE'")
    @Lob
    @Column(name = "status")
    private String status;

    public Venda() {
    }
    public Venda(Integer id, Usuario usuario, Instant dataVenda, BigDecimal total, String status) {
        this.id = id;
        this.usuario = usuario;
        this.dataVenda = dataVenda;
        this.total = total;
        this.status = status;
    }
    @PrePersist
    protected void onCreate() {
        if (this.dataVenda == null) {
            this.dataVenda = Instant.now();
        }
        if (this.status == null) {
            this.status = "PENDENTE";
        }
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

    public Instant getDataVenda() {
        return dataVenda;
    }

    public void setDataVenda(Instant dataVenda) {
        this.dataVenda = dataVenda;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}