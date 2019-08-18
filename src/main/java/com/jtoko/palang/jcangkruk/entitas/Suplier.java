package com.jtoko.palang.jcangkruk.entitas;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Suplier {

	@Id
	private String id;
	private String nm, almt, jns, tlp;
	private Boolean deleted, blocked;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getJns() {
		return jns;
	}
	public void setJns(String jns) {
		this.jns = jns;
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
