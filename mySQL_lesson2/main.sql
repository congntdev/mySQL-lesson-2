-- I
-- lấy danh sách học viên có học ít nhất 1 khóa học của athena
select full_name, count(course_id)
from students.student join students.student_course on student.id = student_course.student_id
group by student_id
having count(course_id) > 0;

-- lấy danh sách khóa học đang diễn ra trong tháng này
 select *from students.course 
 where month(start_time) = 10 and month(end_time) = 10;
 
--  lấy danh sách thông tin những học viên chưa đóng học phí
select full_name, name
from 
	students.student_course
    join students.student on student.id = student_course.student_id
	   join students.course on  course.id = student_course.course_id
where fee = 0;

-- lớp có nhiều học viên và ít học viên nhất 
select name, count(student_id)
from
	students.testing
     join students.student on testing.student_id = student.id
     join students.course on testing.course_id = course.id
group by name
order by count(student_id) asc
limit 1;

select name, count(student_id) as 'students max'
from
	students.testing
     join students.student on testing.student_id = student.id
     join students.course on testing.course_id = course.id
group by name
order by count(student_id) desc 
limit 1;


-- II
-- lấy danh sách điểm số của học viên theo từng khóa học
select full_name, name, score
from
	students.testing
    join students.student on testing.student_id = student.id
    join students.course on testing.course_id = course.id 
    order by name;

-- đưa ra danh sách điểm cao nhất của học viên theo từng khóa
select full_name, name, max(score)
from
	students.testing
     join students.student on testing.student_id = student.id
     join students.course on testing.course_id = course.id
group by name;

-- danh sách học vien học nhiều hơn 2 khóa và điểm > 8 
select full_name, round(sum(score)/count(score),1) as GPA
from 
	students.testing 
	join students.student on testing.student_id = student.id 
    join students.course on testing.course_id = course.id 
group by full_name
having GPA > 8 and count(course.id) > 1; 