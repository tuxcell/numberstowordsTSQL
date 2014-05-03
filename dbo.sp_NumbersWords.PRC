SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sp_NumbersWords(@s VARCHAR(50), @words VARCHAR(8000) out) 
--English words for numbers
as
DECLARE @a char(1),@b char(1),@c char(1),@i int, @j int, @result VARCHAR(1024), @orlen int
SET @orlen=LEN(@s)
IF LEN(@s) % 3>0
	SET @s=' '+@S
IF LEN(@s) % 3>0
	SET @s=' '+@S
SET @i=1 SET @result=''
IF LEN(@s)=1 AND @s='0' 
	SET @result='zero'
WHILE @i<=LEN(@s)
	BEGIN
	SET @j=LEN(@s)-@i+1
	SET @a=substring(@s,@j,1)
	SET @b=substring(@s,@j-1,1)
	SET @c=substring(@s,@j-2,1)
	if isnumeric(@a)=1
		BEGIN
print @c+@b+@a
		SET @result=case 
			WHEN (@i-1=3) AND (@c+@b+@a<>'000') THEN 'thousand'
			WHEN (@i-1=6) AND (@c+@b+@a<>'000')  THEN 'million'
			WHEN (@i-1=9) AND (@c+@b+@a<>'000')  THEN 'billion'
			WHEN (@i-1=12) AND (@c+@b+@a<>'000')  THEN 'trillion'
			WHEN (@i-1=15) AND (@c+@b+@a<>'000')  THEN 'quadrillion'
			WHEN (@i-1=18) AND (@c+@b+@a<>'000')  THEN 'quintillion'
			WHEN (@i-1=21) AND (@c+@b+@a<>'000')  THEN 'sextillion'
			WHEN (@i-1=24) AND (@c+@b+@a<>'000')  THEN 'septillion'
			WHEN (@i-1=27) AND (@c+@b+@a<>'000') THEN 'octillion'
			WHEN (@i-1=30)  AND (@c+@b+@a<>'000') THEN 'nonillion'
			WHEN (@i-1=33) AND (@c+@b+@a<>'000') THEN 'decillion'
			WHEN (@i-1=36) AND (@c+@b+@a<>'000')  THEN 'undecillion'
			WHEN (@i-1=39) AND (@c+@b+@a<>'000') THEN 'duodecillion'
			WHEN (@i-1=42) AND (@c+@b+@a<>'000') THEN 'tredecillion'
			WHEN (@i-1=45) AND (@c+@b+@a<>'000') THEN 'quattuordecillion'
			WHEN (@i-1=48) AND (@c+@b+@a<>'000') THEN 'quindecillion'
			WHEN (@i-1=51) AND (@c+@b+@a<>'000')  THEN 'sexdecillion'
			WHEN (@i-1=54) AND (@c+@b+@a<>'000')  THEN 'septendecillion'
			WHEN (@i-1=57) AND (@c+@b+@a<>'000')   THEN 'octodecillion'
			WHEN (@i-1=60) THEN 'novemdecillion'
			ELSE ''
			END+' '+@result
		if @b!='1' OR @b=' '
			SET @result=case @a 
					WHEN '1' THEN 'one'
					WHEN '2' THEN 'two'
					WHEN '3' THEN 'three'
					WHEN '4' THEN 'four'
					WHEN '5' THEN 'five'
					WHEN '6' THEN 'six'
					WHEN '7' THEN 'seven'
					WHEN '8' THEN 'eight'
					WHEN '9' THEN 'nine'
					ELSE ''
					END+' '+@result
		if (isnumeric(@b)=1 )AND (@b!='0')
			IF @b='1'
			SET @result=case @a 
					WHEN '0' THEN 'ten'
					WHEN '1' THEN 'eleven'
					WHEN '2' THEN 'twelve'
					WHEN '3' THEN 'thirteen'
					WHEN '4' THEN 'fourteen'
					WHEN '5' THEN 'fifteen'
					WHEN '6' THEN 'sixteen'
					WHEN '7' THEN 'seventeen'
					WHEN '8' THEN 'eighteen'
					WHEN '9' THEN 'nineteen'
					ELSE ''
					END+' '+@result
			ELSE
			SET @result=case @b 
					WHEN '2' THEN 'twenty'
					WHEN '3' THEN 'thirty'
					WHEN '4' THEN 'fourty'
					WHEN '5' THEN 'fifty'
					WHEN '6' THEN 'sixty'
					WHEN '7' THEN 'seventy'
					WHEN '8' THEN 'eighty'
					WHEN '9' THEN 'ninety'
					ELSE ''
					END+' '+@result
		END
		if (isnumeric(@c)=1)AND (@c!='0')
			SET @result=case @c 
			WHEN '1' THEN 'one'
			WHEN '2' THEN 'two'
			WHEN '3' THEN 'three'
			WHEN '4' THEN 'four'
			WHEN '5' THEN 'five'
			WHEN '6' THEN 'six'
			WHEN '7' THEN 'seven'
			WHEN '8' THEN 'eight'
			WHEN '9' THEN 'nine'
			ELSE ''
			END+' hundred'+' '+@result
	SET @i=@i+3
	END
SET @result=LTRIM(RTRIM(@result))
set @words= @result
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

