SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE  sp_NúmerosPalabras(@s VARCHAR(50), @words VARCHAR(8000) out) 
--Spanish words for numbers
AS
DECLARE @a char(1),@b char(1),@c char(1),@i int, @j int, @result VARCHAR(1024), @orlen int
SET @orlen=LEN(@s)
IF LEN(@s) % 3>0
	SET @s=' '+@S
IF LEN(@s) % 3>0
	SET @s=' '+@S
SET @i=1 SET @result=''
IF LEN(@s)=1 AND @s='0' 
	SET @result='cero'
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
			WHEN (@i-1=6)  AND (@c+@b+@a<>'000')  AND(@orlen=7)AND(@a='1')   THEN 'millón '
			WHEN (@i-1=6)  AND (@c+@b+@a<>'000') THEN 'millones '
			WHEN (@i-1=9)  AND (@c+@b+@a<>'000')  THEN 'mil millones'
			WHEN (@i-1=12)  AND (@c+@b+@a<>'000')  AND (@orlen=13)AND(@a='1')   THEN 'billón '
			WHEN (@i-1=12)  AND (@c+@b+@a<>'000') THEN 'billones '
			WHEN (@i-1=15)  AND (@c+@b+@a<>'000') THEN 'mil billones'
			WHEN (@i-1=18)  AND (@c+@b+@a<>'000')  AND (@orlen=19)AND(@a='1')   THEN 'trillón '
			WHEN (@i-1=18)   AND (@c+@b+@a<>'000') THEN 'trillones '
			WHEN (@i-1=21)  AND (@c+@b+@a<>'000')  THEN 'mil trillones'
			WHEN (@i-1=24)  AND (@c+@b+@a<>'000')  AND (@orlen=25)AND(@a='1')   THEN 'quadrillón '
			WHEN  (@i-1=24)  AND (@c+@b+@a<>'000')  THEN 'quadrillones '
			WHEN (@i-1=27)  AND (@c+@b+@a<>'000')   THEN 'mil quadrillones'
			WHEN (@i-1=30)  AND (@c+@b+@a<>'000')  AND (@orlen=31)AND(@a='1')   THEN 'quintillón '
			WHEN  (@i-1=30)  AND (@c+@b+@a<>'000')  THEN 'quintillones '
			WHEN (@i-1=33)  AND (@c+@b+@a<>'000')  THEN 'mil quintillones'
			WHEN (@i-1=36)  AND (@c+@b+@a<>'000')  AND (@orlen=37)AND(@a='1')   THEN 'sextillón '
			WHEN  (@i-1=36)  AND (@c+@b+@a<>'000')  THEN 'sextillones '
			WHEN (@i-1=39)  AND (@c+@b+@a<>'000')  THEN 'mil sextillones'
			WHEN (@i-1=42)  AND (@c+@b+@a<>'000')  AND (@orlen=43)AND(@a='1')   THEN 'septillón '
			WHEN  (@i-1=42)  AND (@c+@b+@a<>'000')   THEN 'septillones '
			WHEN (@i-1=45)  AND (@c+@b+@a<>'000')  THEN 'mil septillones'
			WHEN (@i-1=48)  AND (@c+@b+@a<>'000') AND (@orlen=49)AND(@a='1')   THEN 'octillón '
			WHEN  (@i-1=48)   AND (@c+@b+@a<>'000')  THEN 'octillones '
			WHEN (@i-1=51)  AND (@c+@b+@a<>'000')   THEN 'mil octillones'
			WHEN (@i-1=54)  AND (@c+@b+@a<>'000')  AND (@orlen=55)AND(@a='1')   THEN 'nonillón '
			WHEN  (@i-1=54)  AND (@c+@b+@a<>'000')  THEN 'nonillones '
			WHEN (@i-1=57) THEN 'mil nonillones'
			ELSE ''
			END+' '+@result
		if @b!='1' OR @b=' '
			SET @result=case @a 
					WHEN '1' THEN 'un'
					WHEN '2' THEN 'dos'
					WHEN '3' THEN 'tres'
					WHEN '4' THEN 'cuatro'
					WHEN '5' THEN 'cinco'
					WHEN '6' THEN 'seis'
					WHEN '7' THEN 'siete'
					WHEN '8' THEN 'ocho'
					WHEN '9' THEN 'nueve'
					ELSE ''
					END+' '+@result
		if (isnumeric(@b)=1 )AND (@b!='0')
			IF @b='1' OR @b='2' 
			SET @result=case @b+@a 
					WHEN '10' THEN 'diez'
					WHEN '11' THEN 'once'
					WHEN '12' THEN 'doce'
					WHEN '13' THEN 'trece'
					WHEN '14' THEN 'catorce'
					WHEN '15' THEN 'quince'
					WHEN '16' THEN 'dieciséis'
					WHEN '17' THEN 'diecisiete'
					WHEN '18' THEN 'dieciocho'
					WHEN '19' THEN 'diecinueve'
					WHEN '20' THEN 'veinte'
					WHEN '21' THEN 'veintiuno'
					WHEN '22' THEN 'veintidós'
					WHEN '23' THEN 'veintitrés'
					WHEN '24' THEN 'veinticuatro'
					WHEN '25' THEN 'veinticinco'
					WHEN '26' THEN 'veintiséis'
					WHEN '27' THEN 'veintisiete'
					WHEN '28' THEN 'veintiocho'
					WHEN '29' THEN 'veintinueve'
					ELSE ''
					END+' '+@result
			ELSE
			SET @result=case @b 

					WHEN '3' THEN 'treinta'
					WHEN '4' THEN 'cuarenta'
					WHEN '5' THEN 'cincuenta'
					WHEN '6' THEN 'sesenta'
					WHEN '7' THEN 'setenta'
					WHEN '8' THEN 'ochenta'
					WHEN '9' THEN 'noventa'
					ELSE ''
					END+case @a WHEN '0' THEN '' ELSE ' y' END+' '+@result
		END
		if (isnumeric(@c)=1)AND (@c!='0')
			IF @a='0'  AND @b='0' 
				SET @result=case @c 
					WHEN '1' THEN 'cien'
					WHEN '2' THEN 'doscientos'
					WHEN '3' THEN 'trescientos'
					WHEN '4' THEN 'cuatrocientos'
					WHEN '5' THEN 'quinientos'
					WHEN '6' THEN 'seiscientos'
					WHEN '7' THEN 'setecientos'
					WHEN '8' THEN 'ochocientos'
					WHEN '9' THEN 'novecientos'
				ELSE ''
				END+' '+@result
			ELSE
				SET @result=case @c 
					WHEN '1' THEN 'ciento'
					WHEN '2' THEN 'doscientos'
					WHEN '3' THEN 'trescientos'
					WHEN '4' THEN 'cuatrocientos'
					WHEN '5' THEN 'quinientos'
					WHEN '6' THEN 'seiscientos'
					WHEN '7' THEN 'setecientos'
					WHEN '8' THEN 'ochocientos'
					WHEN '9' THEN 'novecientos'
				ELSE ''
				END+' '+@result
	SET @i=@i+3
	END
SET @result=LTRIM(RTRIM(@result))
IF left(@result,7)='un mil '
	SET @result=right(@result,LEN(@result)-3)
IF right(@result,3)=' un'
	SET @result=@result+'o'
IF left(@result,2)='y '
	SET @result=right(@result,LEN(@result)-2)
While CHARINDEX('  ', @result)>0
	SET @result=REPLACE(@result,'  ',' ')
exec sp_INCLUDED 'millones', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil millones','mil')
exec sp_INCLUDED 'billones', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil billones','mil')
exec sp_INCLUDED 'trillones', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil trillones','mil')
exec sp_INCLUDED 'quadrillones', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil quadrillones','mil')
exec sp_INCLUDED 'quintillones', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil quintillones','mil')
exec sp_INCLUDED 'sextillones', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil sextillones','mil')
exec sp_INCLUDED 'septillones', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil septillones','mil')
exec sp_INCLUDED 'octillones', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil octillones','mil')
exec sp_INCLUDED 'nonillones', @result, @i out
IF @i>1
	SET @result=REPLACE(@result,'mil nonillones','mil')
set @words= @result
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

