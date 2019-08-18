package com.jtoko.palang.jcangkruk.entitas;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Barang {

	@Id
	private String kode;
	private String nm, satuan, hrg;
	private Float stok;
	private Boolean deleted, biji;
	public String getKode() {
		return kode;
	}
	public void setKode(String kode) {
		this.kode = kode;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getSatuan() {
		return satuan;
	}
	public void setSatuan(String satuan) {
		this.satuan = satuan;
	}
	public String getHrg() {
		return hrg;
	}
	public void setHrg(String hrg) {
		this.hrg = hrg;
	}
	public Float getStok() {
		return stok;
	}
	public void setStok(Float stok) {
		this.stok = stok;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	public Boolean getBiji() {
		return biji;
	}
	public void setBiji(Boolean biji) {
		this.biji = biji;
	}
}
