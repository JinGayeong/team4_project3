package controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import domain.CboardVO;
import domain.CbCriteria;
import domain.CbPageMaker;
import service.CboardService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/cboard")
public class CboardController {

	private static final Logger logger = LoggerFactory.getLogger(CboardController.class);

	@Inject
	private CboardService cboardService;

	//게시물 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listCboard(CbCriteria cri, Model model) throws Exception {
		
		model.addAttribute("list", cboardService.listCboard(cri));
		
		CbPageMaker pageMaker = new CbPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cboardService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "cboard/list";
	}

	// 게시물 등록
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGET() throws Exception {
		logger.info("write get ...........");
	}
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(CboardVO cboard, RedirectAttributes rttr) throws Exception {
		
		logger.info("write post ...........");
		logger.info(cboard.toString());
		cboardService.writeCboard(cboard);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/cboard/list";
	}

	// 게시물 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void cboardRead(CboardVO cboard, int cbno, Model model) throws Exception {

		model.addAttribute("cboard", cboardService.readCboard(cbno));
	}

	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("cbno") int cbno, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("cboard", cboardService.readCboard(cbno));
	}
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(CboardVO cboard) throws Exception{
		logger.info("update");
		
		cboardService.modifyCboard(cboard);
		
		return "redirect:/cboard/list";
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteGET(@RequestParam("cbno") int cbno) throws Exception {

		cboardService.deleteCboard(cbno);

		return "redirect:/cboard/list";
	}

}