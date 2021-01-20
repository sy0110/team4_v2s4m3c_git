package dev.mvc.review;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.review.ReviewVO;

@Controller
public class ReviewCont {
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;

  public ReviewCont() {
    System.out.println("--> ReviewCont created.");
  }

  /**
   * ����� http://localhost:9090/team4/review/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/review/create_form.do", method = RequestMethod.GET)
  public ModelAndView create_form() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/create_form");
    return mav;
  }

  /*  *//**
         * ���ó�� http://localhost:9090/team4/review/create.do
         * 
         * @return
         *//*
            * @RequestMapping(value = "/review/create.do", method = RequestMethod.POST)
            * public ModelAndView create(ReviewVO reviewVO) { ModelAndView mav = new
            * ModelAndView(); mav.setViewName("/review/create_msg");
            * 
            * int rev_cnt = this.reviewProc.create(reviewVO); mav.addObject("rev_cnt",
            * rev_cnt);
            * 
            * return mav; }
            */

  /**
   * Ajax ��� ��� ó�� http://localhost:9090/resort/categrp/create_ajax.do
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/create_ajax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String create_ajax(ReviewVO reviewVO) {
    int cnt = this.reviewProc.create(reviewVO);

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * ��� (�����ϼ�)
   * 
   * @return
   */
  @RequestMapping(value = "/review/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<ReviewVO> list = this.reviewProc.list_rev_no();
    mav.addObject("list", list);

    mav.setViewName("/review/list_ajax");
    return mav;
  }

  /**
   * ��� (������ǥ:Ư�� ȸ�縸 ������)
   * 
   * @return
   */
  @RequestMapping(value = "/review/list_final.do", method = RequestMethod.GET)
  public ModelAndView list_final(@RequestParam(value = "rev_no", defaultValue = "1") int rev_no,
      @RequestParam(value = "com_name", defaultValue = "") String com_name,
      @RequestParam(value = "nowPage", defaultValue = "1") int nowPage) {
    ModelAndView mav = new ModelAndView();
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("rev_no", rev_no); // #{cateno}
    map.put("com_name", com_name); // #{word}
    map.put("nowPage", nowPage); // �������� ����� ���ڵ��� ������ �����ϱ����� ���

    // �˻� ���
    List<ReviewVO> list = reviewProc.list_comno(map);
    mav.addObject("list", list);

    // �˻��� ���ڵ� ����
    int search_count = reviewProc.search_count(map);
    mav.addObject("search_count", search_count);

    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� ���� ������: 11 / 22 [����] 11 12 13 14 15 16 17
     * 18 19 20 [����]
     * 
     * @param listFile ��� ���ϸ�
     * 
     * @param cateno ī�װ���ȣ
     * 
     * @param search_count �˻�(��ü) ���ڵ��
     * 
     * @param nowPage ���� ������
     * 
     * @param word �˻���
     * 
     * @return ����¡ ���� ���ڿ�
     */
    String paging = reviewProc.pagingBox("list.do", rev_no, search_count, nowPage, com_name);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);
    mav.setViewName("/review/list.do");

    return mav;
  }

  /**
   * ��ȸ
   * 
   * @return
   */
   @RequestMapping(value = "/review/read.do", method = RequestMethod.GET) 
   public ModelAndView read(int rev_no) {
     ModelAndView mav = new ModelAndView();
   
     ReviewVO reviewVO = this.reviewProc.read(rev_no); mav.addObject("reviewVO",
     reviewVO);
  
     mav.setViewName("/review/read");
   
     return mav; 
   }

   /*
       * Ajax read
       * 
       * @return
       */
  /*
   * @ResponseBody
   * 
   * @RequestMapping(value = "/review/read_ajax.do", method = RequestMethod.GET,
   * produces = "text/plain;charset=UTF-8") public String read_ajax(int rev_no) {
   * ReviewVO reviewVO = this.reviewProc.read(rev_no);
   * 
   * JSONObject json = new JSONObject(); json.put("rev_no", rev_no);
   * json.put("com_name", reviewVO.getCom_name()); json.put("rev_title",
   * reviewVO.getRev_title()); json.put("rev_score", reviewVO.getRev_score());
   * json.put("rev_depart", reviewVO.getRev_depart()); json.put("rev_content",
   * reviewVO.getRev_content()); json.put("rev_visible",
   * reviewVO.getRev_visible()); json.put("comno", reviewVO.getComno());
   * 
   * return json.toString(); }
   */
   
   
  /**
   * ���� ��
   * 
   * @return
   */
  @RequestMapping(value = "/review/update.do", method = RequestMethod.GET)
  public ModelAndView update(int rev_no) {
    ModelAndView mav = new ModelAndView();

    ReviewVO reviewVO = this.reviewProc.read(rev_no);
    mav.addObject("reviewVO", reviewVO); // request.setAttribute("contentsVO", contentsVO);

    mav.setViewName("/review/update"); // webapp/contents/update.jsp

    return mav;
  }

  /**
   * ���� ó��
   * 
   * @param contentsVO
   * @return
   */
  @RequestMapping(value = "/review/update.do", method = RequestMethod.POST)
  public ModelAndView update(ReviewVO reviewVO) {
    ModelAndView mav = new ModelAndView();

    int rev_cnt = this.reviewProc.update(reviewVO);
    mav.addObject("rev_cnt", rev_cnt); // request�� ����

    mav.setViewName("/review/update_msg");

    return mav;
  }

  /**
   * Ajax ��� ���� ó��
   */
  @ResponseBody
  @RequestMapping(value = "/review/update_ajax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String update_ajax(ReviewVO reviewVO) {
    int cnt = this.reviewProc.update(reviewVO); // ��� ó��

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * ��ȸ + ������ http://localhost:9090/resort/cate/read_delete.do
   * 
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/review/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int rev_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/read_delete");

    ReviewVO reviewVO = this.reviewProc.read(rev_no);
    mav.addObject("reviewVO", reviewVO);

    return mav; // forward
  }

  /**
   * ���� ��, attachfile Ajax ��� ���� ����
   * 
   * @return
   */
  @RequestMapping(value = "/review/delete_form.do", method = RequestMethod.GET)
  public ModelAndView delete_form(int rev_no) {
    ModelAndView mav = new ModelAndView();

    ReviewVO reviewVO = this.reviewProc.read(rev_no);
    mav.addObject("reviewVO", reviewVO); // request.setAttribute("contentsVO", contentsVO);

    mav.setViewName("/review/delete"); // webapp/contents/delete.jsp

    return mav;
  }

  /**
   * ���� ó��
   * 
   * @param cateVO
   * @return
   */
  @RequestMapping(value = "/review/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int rev_no) {
    ModelAndView mav = new ModelAndView();

    ReviewVO reviewVO = this.reviewProc.read(rev_no);
    mav.addObject("reviewVO", reviewVO);

    int rev_cnt = this.reviewProc.delete(rev_no);
    mav.addObject("rev_cnt", rev_cnt); // request�� ����

    mav.setViewName("/review/delete_msg"); // webapp/cate/delete_msg.jsp

    return mav;
  }

  /**
   * Ajax ���� ó��
   * 
   * @param categrpno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/review/delete_ajax.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String delete_ajax(int rev_no) {
    int cnt = this.reviewProc.delete(rev_no);

    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * ���ΰ�ħ�� �����ϴ� �޽��� ���
   * 
   * @param memberno
   * @return
   */
  @RequestMapping(value = "/review/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    // ��� ó�� �޽���: create_msg --> /review/create_msg.jsp
    // ���� ó�� �޽���: update_msg --> /review/update_msg.jsp
    // ���� ó�� �޽���: delete_msg --> /review/delete_msg.jsp
    mav.setViewName("/review/" + url); // forward

    return mav; // forward
  }

}
