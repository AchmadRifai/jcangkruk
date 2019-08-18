package com.jtoko.palang.jcangkruk;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.jtoko.palang.jcangkruk.entitas.Pelanggan;
import com.jtoko.palang.jcangkruk.entitas.dao.PelangganRepository;

@RestController
@RequestMapping(path = "/api")
public class ApiController {

	@Autowired
	private PelangganRepository pelDao;

	@GetMapping(path="/allPel")
	public @ResponseBody List<Pelanggan> allPel() {
		var l = new java.util.LinkedList<Pelanggan>();
		for (Pelanggan p:pelDao.findAll()) if (!p.getDeleted())
			l.add(p);
		return l;
	}

	@GetMapping(path="/satuPel/{kode}")
	public @ResponseBody Pelanggan satuPel(@PathVariable String kode) {
		var p = new Pelanggan();
		var g = pelDao.findById(kode);
		if (g.isEmpty()) {
			p.setAlmt("-");
			p.setBlocked(false);
			p.setDeleted(false);
			p.setKode("-");
			p.setNm("-");
			p.setTlp("-");
		} else p = g.get();
		return p;
	}
}
