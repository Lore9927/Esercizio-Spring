package it.objectmethod.esercizio.controller;

import java.util.List;



import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import it.objectmethod.esercizio.dao.ICityDao;
import it.objectmethod.esercizio.dao.impl.CityDaoImpl;
import it.objectmethod.esercizio.model.City;

@Controller
public class CityController {

	private ICityDao cityDao = new CityDaoImpl();
	
	@GetMapping("/{country-code}/city")
	public String cityNameGet(@PathVariable("country-code") String codiceNazione, ModelMap map) {
		List<City> city = cityDao.findCityByCode(codiceNazione);
		map.addAttribute("city", city);

		return "city";
	}
	
	@GetMapping("/find-city")
	public String prepareFindCity() {
		return "findCity";
	}
	
	@GetMapping("/get-city")
	public String findCityByNameOrCountry(@RequestParam("nomeCitta") String citta, @RequestParam("codiceNazione") String codice, ModelMap map) {
		List<City> city = cityDao.findCityByNameOrCode(citta, codice);
		map.addAttribute("city", city);
		 
		return "city";
	}
	
	@GetMapping("/{id}/form-city")
	public String prepareAddOrUpdateCity(@PathVariable("id") Long id, ModelMap map) {
		if(id != 0)
		{
			City city = cityDao.findCityByID(id);
			map.addAttribute("city", city);
		}
		
		return "addUpdateCity";
	}
	
	@GetMapping("/add-update-city")
	public String AddOrUpdateCity(@RequestParam("id") Long id, @RequestParam("nomeCitta") String citta, @RequestParam("codiceNazione") String codice, @RequestParam("regione") String regione, @RequestParam("popolazione") Long popolazione, ModelMap map) {
		int righeAggiornate = 0;
		int righeInserite = 0;
		String ris = "Errore durante l'operazione!";
		if(id != 0)
		{
			righeAggiornate = cityDao.updateCity(id, citta, codice, regione, popolazione);
			if(righeAggiornate > 0)
			{
				ris = "Modifica completata!";
			}
		}
		else
		{
			righeInserite = cityDao.addCity(citta, codice, regione, popolazione);
			if(righeInserite > 0)
			{
				ris = "Inserimento completato!";
			}
		}
		map.addAttribute("esito", ris);
		return "addUpdateCity";
	}
}
