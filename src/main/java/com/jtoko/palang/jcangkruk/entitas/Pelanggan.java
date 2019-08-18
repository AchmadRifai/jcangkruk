package com.jtoko.palang.jcangkruk.entitas;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Pelanggan {

	@Id
	private String kode;
	private String nm, almt, tlp;
	private Boolean deleted, blocked;
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
	public String getAlmt() {
		return almt;
	}
	public void setAlmt(String almt) {
		this.almt = almt;
	}
	public String getTlp() {
		return tlp;
	}
	public void setTlp(String tlp) {
		this.tlp = tlp;
	}
	public Boolean getDeleted() {
		return deleted;
	}
	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
	public Boolean getBlocked() {
		return blocked;
	}
	public void setBlocked(Boolean blocked) {
		this.blocked = blocked;
	}
}
