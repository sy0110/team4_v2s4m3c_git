package dev.mvc.resume;

import java.util.List;

public interface ResumeProcInter {
  
  /**
   * ���
   * @param resumeVO
   * @return
   */
  public int create(ResumeVO resumeVO);
  
  /**
   * ��� ī�װ��� ��ϵ� �۸��
   * @return
   */
  public List<ResumeVO> list_all();

  /**
   * ��ȸ
   */
  public ResumeVO read(int res_no);


}
