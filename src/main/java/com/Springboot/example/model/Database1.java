package com.Springboot.example.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "database1")
public class Database1 implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int id;
	@Column(name = "date")
	public String date;
	@Column(name = "idkpi")
	public float idKpi;
	@Column(name = "valeur_dim")
	public String val_dim;
	@Column(name = "dbname")
	public String dbname;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public float getIdKpi() {
		return idKpi;
	}
	@Column(name = "val_kpi")
	public float val_kpi;
	@Column(name = "system")
	public String systeme;
	@Column(name = "database_name")
	public String database_name;
	@JoinColumn(name = "id_kpi", nullable = false)
	@ManyToOne(fetch = FetchType.EAGER)
	private Kpi kpii;

	public Kpi getKpi() {
		return kpii;
	}

	public void setKpi(Kpi kpi) {
		this.kpii = kpi;
	}

	public float getVal_kpi() {
		return val_kpi;
	}
	public void setVal_kpi(float val_kpi) {
		this.val_kpi = val_kpi;
	}
	public String getSysteme() {
		return systeme;
	}
	public void setSysteme(String systeme) {
		this.systeme = systeme;
	}
	public String getDatabase_name() {
		return database_name;
	}
	public void setDatabase_name(String database_name) {
		this.database_name = database_name;
	}
	public void setIdKpi(float idKpi) {
		this.idKpi = idKpi;
	}
	public String getVal_dim() {
		return val_dim;
	}
	public void setVal_dim(String val_dim) {
		this.val_dim = val_dim;
	}
	public String getDbname() {
		return dbname;
	}
	public void setDbname(String dbname) {
		this.dbname = dbname;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public Database1(int id, String date, float idKpi, String val_dim, String dbname, float val_kpi, String systeme,
			String database_name) {
		super();
		this.id = id;
		this.date = date;
		this.idKpi = idKpi;
		this.val_dim = val_dim;
		this.dbname = dbname;
		this.val_kpi = val_kpi;
		this.systeme = systeme;
		this.database_name = database_name;
	}
	@Override
	public String toString() {
		return "Rsl_test_sys [date=" + date + ", idKpi=" + idKpi + ", val_dim=" + val_dim + ", val_kpi=" + val_kpi
				+ ", systeme=" + systeme + ",database_name=" + database_name;
	}
	public Database1() {
		super();
	}
}
