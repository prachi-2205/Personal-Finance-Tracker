package com.svs.etracker.controller;

import java.awt.image.BufferedImage
;
import java.awt.image.DataBufferByte;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.persistence.EntityManager;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.svs.etracker.model.Category;
import com.svs.etracker.model.Expense;
import com.svs.etracker.model.Income;
import com.svs.etracker.model.UploadImage;
import com.svs.etracker.service.CategoryService;
import com.svs.etracker.service.ExpenseService;
import com.svs.etracker.service.ImageService;
import com.svs.etracker.service.IncomeService;

@Controller
public class IncomeController {

	@Autowired
	private IncomeService expenseService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ImageService imageService;

	@Autowired
	public EntityManager entityManager;

	@Value("${address}")
	private String address;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setDisallowedFields(new String[] { "category" });
		binder.setDisallowedFields(new String[] { "image" });
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, "createdDate", new CustomDateEditor(format, false));
	}

	@RequestMapping(value = "/IncomeView", method = RequestMethod.GET)
	public String hello(Model model) {

		List<String> categories = categoryService.getOnlyCategories();
		model.addAttribute("categories", categories);
		String addressAddEmployee = address+"trackerIncome";
		String incomeTracker=address+"IncomeView";
		model.addAttribute("empaddress", addressAddEmployee);
		model.addAttribute("IncomeView", incomeTracker);
		return "IncomeView";
	}

	@RequestMapping(value = "/incomeSubmission", method = RequestMethod.POST)
	public String greetingSubmit(@Valid @ModelAttribute Income income, @RequestParam("category") String category,
			BindingResult result, Model model, @RequestParam(value = "image", required=false) MultipartFile file) throws IOException {

		if (result.hasErrors()) {
			return "IncomeView";
		}
		else{
			int categoryId = categoryService.getCategoryId(category);
			income.setCategoryId(categoryId);
			expenseService.addIncome(income);
			model.addAttribute("Saved", "Income Saved");
			return "redirect:/IncomeView";
		}
	}
}
