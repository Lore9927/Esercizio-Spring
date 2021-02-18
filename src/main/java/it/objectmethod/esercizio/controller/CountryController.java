package it.objectmethod.esercizio.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import it.objectmethod.esercizio.dao.ICountryDao;
import it.objectmethod.esercizio.dao.impl.CountryDaoImpl;
import it.objectmethod.esercizio.model.Country;

@SessionAttributes({"conti","nazioni"})
@Controller
public class CountryController {
	
	private ICountryDao countryDao = new CountryDaoImpl();
	
	@GetMapping("/continent")
	public String homeGet(ModelMap map) {
		List<Country> conts = countryDao.getContinent();
		map.addAttribute("continenti", conts);

		return "continent";
	}
	
	@GetMapping("/country")
	public String countryNameGet(@RequestParam("cont") String continente, ModelMap map) {
		List<Country> country = countryDao.findCountryByContinent(continente);
		map.addAttribute("conti", continente);
		map.addAttribute("nazioni", country);

		return "country";
	}
	
}
