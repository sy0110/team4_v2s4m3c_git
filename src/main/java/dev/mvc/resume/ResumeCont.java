package dev.mvc.resume;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class ResumeCont {
  @Autowired
  @Qualifier("dev.mvc.resume.ResumeProc")
  private ResumeProcInter resumeProc;
  
  /**
   * �����
   * @return
   */
  @RequestMapping(value = "/resume/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/resume/create");
    return mav;
  }
  
  @RequestMapping(value = "/resume/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, ResumeVO resumeVO) {
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String res_pic = "";     // main image
    String res_thumb = ""; // preview image
    String upDir = Tool.getRealPath(request, "/resume/storage/main_images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = resumeVO.getRes_picMF();
    long res_size = mf.getSize();  // ���� ũ��
    if (res_size > 0) { // ���� ũ�� üũ
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      res_pic = Upload.saveFileSpring(mf, upDir);
      
      if (Tool.isImage(res_pic)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        res_thumb = Tool.preview(upDir, res_pic, 120, 80); 
      }      
    }    
    
//    String res_mail2 = "";
//    res_mail2 = "@" + res_mail2;
    
    resumeVO.setRes_pic(res_pic);
    resumeVO.setRes_thumb(res_thumb);
    resumeVO.setRes_size(res_size);
    //resumeVO.setRes_mail2(res_mail2);
    
    
    // -------------------------------------------------------------------
    // ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    mav.setViewName("/resume/create_msg"); 
    
    int cnt = this.resumeProc.create(resumeVO);
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }
  
  /**
   * ȸ�� ��ü �̷¼� ���
   * @return
   */
  @RequestMapping(value = "/resume/list_all.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/resume/list_all"); // /webapp/contents/list_all.jsp

    List<ResumeVO> list = this.resumeProc.list_all();
    mav.addObject("list", list);

    return mav; // forward
  }

  /**
   * ��ȸ
   * @return
   */
  @RequestMapping(value="/resume/read.do", method=RequestMethod.GET )
  public ModelAndView read(int res_no) {
    ModelAndView mav = new ModelAndView();

    ResumeVO resumeVO = this.resumeProc.read(res_no);
    mav.addObject("resumeVO", resumeVO);
    
    mav.setViewName("/resume/read");
    return mav;
  }

  



}
