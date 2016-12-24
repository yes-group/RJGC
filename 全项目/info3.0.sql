/*select class as '班级',tb_student.sno as '学号',sname as '姓名',time as '月考时间',cname as '课程',score as '分数'
from tb_class,tb_student,tb_course,tb_score
where tb_class.id=tb_student.sclass and tb_student.sno=tb_score.sno and tb_score.cno=tb_course.cno
and class="高一（1）班"  and cname="语文" 
order by score desc*/

/*select cname as '课程名',tname as '讲师',class as '任课班级'
from tb_teacher,tb_course,tb_class
where tb_teacher.tno=tb_course.tno and tb_class.id=tb_teacher.tclass
and cname="语文" ;*/
