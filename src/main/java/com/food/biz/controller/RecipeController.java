package com.food.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.food.biz.recipe.EvaluationMonthAvgVO;
import com.food.biz.recipe.EvaluationVO;
import com.food.biz.recipe.RecipeService;
import com.food.biz.recipe.RecipeVO;
import com.food.biz.supplier.SupplierFoodVO;
import com.food.biz.supplier.SupplierService;

@Controller
public class RecipeController {
	@Autowired
	RecipeService recipeService;
	
	@Autowired
	SupplierService sService;

	@RequestMapping(value = "recipeList.do")
	public ModelAndView recipeList(ModelAndView mav) {
		System.out.println("������ ����Ʈ ��ȸ");
		mav.addObject("page", "recipeList.jsp");
		mav.addObject("popularRecipe", recipeService.popularRecipe());
		mav.addObject("recipeList", recipeService.recipeList());
		mav.setViewName("index.jsp");
		return mav;
	}

	   @RequestMapping(value = "recipeDetail.do")
	   public ModelAndView recipeDetail(ModelAndView mav, RecipeVO vo) {
	      mav.addObject("recipe", recipeService.getRecipeOne(vo.getRecipe_code()));
	      mav.addObject("recipeFood", recipeService.recipeDetail(vo));
	      SupplierFoodVO fvo=new SupplierFoodVO();
	      fvo.setSupplier_food_name(vo.getFood_name());
	      mav.addObject("comment",recipeService.getEvaluation(vo.getRecipe_code()));
	      mav.addObject("supplierFoodList",sService.supplierFoodSearch(fvo));
	      mav.addObject("page","recipeDetail.jsp");
	      mav.setViewName("index.jsp");
	      return mav;
	   }

	@RequestMapping(value = "/insertFood.do")
	public String insertFood(RecipeVO vo) {
		System.out.println("������ ������ ��� ");
		if (recipeService.getFoodCode(vo) != null) {
			recipeService.insertFood(vo);
		}
		return "recipeList.do";
	}

	@RequestMapping(value = "recipeSearch.do")
	public ModelAndView recipeSearch(ModelAndView mav, RecipeVO vo) {
		System.out.println("������ �˻� �˻�");
		mav.addObject("page", "recipeList.jsp");
		mav.addObject("recipeList", recipeService.recipeSearch(vo));
		mav.setViewName("index.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/evaluation.do")
	public String insertEvalueation(EvaluationVO vo) {
		System.out.println("��� ��� ");
		recipeService.insertEvaluation(vo);
		RecipeVO recipe = new RecipeVO();
		EvaluationMonthAvgVO ema = new EvaluationMonthAvgVO();
		ema.setEvaluation_month(vo.getEvaluation_month());
		ema.setRecipe_code(vo.getRecipe_code());
		ema.setEvaluation_avg_point(vo.getEvaluation_point());
		if(recipeService.checkEvaluation(ema)==null) {
			recipeService.insertEvaluationAvg(ema);
		}else {
			recipeService.updateEvaluationAvg(ema);
			ema=recipeService.checkEvaluation(ema);
			if(ema.getEvaluation_count()>=5) {
				if(ema.getEvaluation_avg_point()>=4.0) {
					recipe.setRecipe_code(vo.getRecipe_code());
					recipe.setRecipe_grade("���� ���ִ�");
					recipeService.updateRecipeGrade(recipe);
				} else if(ema.getEvaluation_avg_point()>=3.0&&ema.getEvaluation_avg_point()<4.0) {
					recipe.setRecipe_code(vo.getRecipe_code());
					recipe.setRecipe_grade("���ִ�");
					recipeService.updateRecipeGrade(recipe);
				} else {
					recipe.setRecipe_code(vo.getRecipe_code());
					recipe.setRecipe_grade("����");
					recipeService.updateRecipeGrade(recipe);
				}
			}
		}
		return "recipeDetail.do";
	}
}
