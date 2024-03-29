SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE  sp_N�merosPalavras(@s VARCHAR(50), @words  VARCHAR(8000) out ) 
--Portuguese words for numbers
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
		SET @result=case 
			WHEN (@i-1=3)  AND (@c+@b+@a<>'000') THEN 'mil'
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=6)  AND (@c+@b+@a<>'000')  AND(@orlen=7)AND(@a='1')   THEN 'milh�o '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=6)  AND (@c+@b+@a<>'000') THEN 'milh�es '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=9)  AND (@c+@b+@a<>'000')  THEN 'mil milh�es'
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=12)  AND (@c+@b+@a<>'000')  AND (@orlen=13)AND(@a='1')   THEN 'bili�o '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=12)  AND (@c+@b+@a<>'000')  THEN 'bili�es '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=15)  AND (@c+@b+@a<>'000')  THEN 'mil bili�es'
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=18)  AND (@c+@b+@a<>'000') AND (@orlen=19)AND(@a='1')   THEN 'trili�o '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=18)   AND (@c+@b+@a<>'000') THEN 'trili�es '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=21)  AND (@c+@b+@a<>'000')  THEN 'mil trili�es'
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=24)  AND (@c+@b+@a<>'000')  AND (@orlen=25)AND(@a='1')   THEN 'quadrili�o '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN  (@i-1=24)  AND (@c+@b+@a<>'000') THEN 'quadrili�es '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=27)  AND (@c+@b+@a<>'000')  THEN 'mil quadrili�es'
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=30)  AND (@c+@b+@a<>'000') AND (@orlen=31)AND(@a='1')   THEN 'quintili�o '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN  (@i-1=30)  AND (@c+@b+@a<>'000') THEN 'quintili�es '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=33)  AND (@c+@b+@a<>'000')  THEN 'mil quintili�es'
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=36)  AND (@c+@b+@a<>'000')  AND (@orlen=37)AND(@a='1')   THEN 'sextili�o '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN  (@i-1=36)  AND (@c+@b+@a<>'000')  THEN 'sextili�es '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=39)  AND (@c+@b+@a<>'000') THEN 'mil sextili�es'
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=42)  AND (@c+@b+@a<>'000') AND (@orlen=43)AND(@a='1')   THEN 'septili�o '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN  (@i-1=42)  AND (@c+@b+@a<>'000')  THEN 'septili�es '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=45)  AND (@c+@b+@a<>'000') THEN 'mil septili�es'
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=48)  AND (@c+@b+@a<>'000')  AND (@orlen=49)AND(@a='1')   THEN 'octili�es '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN  (@i-1=48)   AND (@c+@b+@a<>'000') THEN 'octili�es '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=51)  AND (@c+@b+@a<>'000')  THEN 'mil octili�es'
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=54)  AND (@c+@b+@a<>'000')  AND (@orlen=55)AND(@a='1')   THEN 'nonili�o '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN  (@i-1=54)  AND (@c+@b+@a<>'000')   THEN 'nonili�es '
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			WHEN (@i-1=57) THEN 'mil nonili�es'
+CASE WHEN (substring(@s,@i,1)='0') AND (substring(@s,LEN(@s)-1,1)!='0') THEN ' e ' WHEN  (substring(@s,@i,1)='0') AND (right(@S,1)!='0') THEN ' e ' ELSE '' END
			ELSE ''
			END+' '+@result
		if @b!='1' OR @b=' '
			SET @result=case @a 
					WHEN '1' THEN 'um'
					WHEN '2' THEN 'dois'
					WHEN '3' THEN 'tr�s'
					WHEN '4' THEN 'quatro'
					WHEN '5' THEN 'cinco'
					WHEN '6' THEN 'seis'
					WHEN '7' THEN 'sete'
					WHEN '8' THEN 'oito'
					WHEN '9' THEN 'nove'
					ELSE ''
					END+' '+@result
		if (isnumeric(@b)=1 )AND (@b!='0')
			IF @b='1'
			SET @result=case @a 
					WHEN '0' THEN 'dez'
					WHEN '1' THEN 'onze'
					WHEN '2' THEN 'doze'
					WHEN '3' THEN 'treze'
					WHEN '4' THEN 'catorze'
					WHEN '5' THEN 'quinze'
					WHEN '6' THEN 'dezasseis'
					WHEN '7' THEN 'dezassete'
					WHEN '8' THEN 'dezoito'
					WHEN '9' THEN 'dezanove'
					ELSE ''
					END+' '+@result
			ELSE
			SET @result=case @b 
					WHEN '2' THEN 'vinte'
					WHEN '3' THEN 'trinta'
					WHEN '4' THEN 'quarenta'
					WHEN '5' THEN 'cinquenta'
					WHEN '6' THEN 'sessenta'
					WHEN '7' THEN 'setenta'
					WHEN '8' THEN 'oitenta'
					WHEN '9' THEN 'noventa'
					ELSE ''
					END+case @a WHEN '0' THEN '' ELSE ' e' END+' '+@result
		END
		if (isnumeric(@c)=1)AND (@c!='0')
			IF @a='0'  AND @b='0' 
				SET @result=case @c 
					WHEN '1' THEN 'e cem'
					WHEN '2' THEN 'e duzentos'
					WHEN '3' THEN 'e trezentos'
					WHEN '4' THEN 'e quatrocentos'
					WHEN '5' THEN 'e quinhentos'
					WHEN '6' THEN 'e seiscentos'
					WHEN '7' THEN 'e setecentos'
					WHEN '8' THEN 'e oitocentos'
					WHEN '9' THEN 'e novecentos'
				ELSE ''
				END+' '+@result
			ELSE
				SET @result=case @c 
					WHEN '1' THEN 'cento e'
					WHEN '2' THEN 'duzentos e'
					WHEN '3' THEN 'trezentos e'
					WHEN '4' THEN 'quatrocentos e'
					WHEN '5' THEN 'quinhentos e'
					WHEN '6' THEN 'seiscentos e'
					WHEN '7' THEN 'setecentos e'
					WHEN '8' THEN 'oitocentos e'
					WHEN '9' THEN 'novecentos e'
				ELSE ''
				END+' '+@result
	SET @i=@i+3
	END
SET @result=LTRIM(RTRIM(@result))
IF left(@result,7)='um mil '
	SET @result=right(@result,LEN(@result)-3)
IF left(@result,2)='e '
	SET @result=right(@result,LEN(@result)-2)
While CHARINDEX('  ', @result)>0
	SET @result=REPLACE(@result,'  ',' ')
exec sp_INCLUDED 'milh�es', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil milh�es','mil')
exec sp_INCLUDED 'bili�es', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil bili�es','mil')
exec sp_INCLUDED 'trili�es', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil trili�es','mil')
exec sp_INCLUDED 'quadrili�es', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil quadrili�es','mil')
exec sp_INCLUDED 'quintili�es', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil quintili�es','mil')
exec sp_INCLUDED 'sextili�es', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil sextili�es','mil')
exec sp_INCLUDED 'septili�es', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil septili�es','mil')
exec sp_INCLUDED 'octili�es', @result, @i out
IF @i>1
IF dbo.INCLUDED('octili�es', @result)>1
	SET @result=REPLACE(@result,'mil octili�es','mil')
exec sp_INCLUDED 'nonili�es', @result, @i out
IF @i>1
IF dbo.INCLUDED('nonili�es', @result)>1
	SET @result=REPLACE(@result,'mil nonili�es','mil')
set @words= @result
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

