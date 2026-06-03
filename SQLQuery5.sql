	--در سال جاری چه درس هایی ارائه شده است
	select l.Title,t.year
	from Terms t 
	join Presentation p on t.TermId=p.TermId
	join Lessons l on l.LessonId= p.LessonId

		--در سال 1405 ترم 1 چه درس هایی ارائه شده است
	select l.Title,t.year, t.period from Terms t join Presentation p on t.TermId=p.TermId
	join Lessons l on l.LessonId= p.LessonId
	where t.period=1 and t.year=1405

		--در سال 1405 ترم 1 هر درس را چه تعداد دانش آموز انتخاب کرده

	select count(us.StudentId) tedad,l.Title,t.TermId,t.year from UnitSelection us 
	join Presentation p on us.PresentationId=p.PresentationId
	join Terms t on t.TermId=p.TermId
	join Lessons l on l.LessonId= p.LessonId
	where t.period=1 and t.year=1405
	group by t.TermId,t.year,l.Title

	-- کدام دانش آموزان انتخاب واحد نکرده اند
	select * from Students s 
	left join UnitSelection us on s.StudentId=us.StudentId
	where us.StudentId is  null
 -- دانش آموزان نمره الف در سال 1405

	select distinct(s.StudentId),* from Students s 
	join UnitSelection us on s.StudentId=us.StudentId
	join Scores on Scores.StudentId=us.StudentId
	where Scores.Score is not null

	 	select * from Presentation
		select * from UnitSelection
		ALTER TABLE UnitSelection ADD Score int;
	insert into UnitSelection(Score) values(18)



