SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sp_INCLUDED (@s varchar(255),@p varchar(255), @counter int out)
 --Returns how many times a string is included (occurs) into another one.
AS
DECLARE @i int,@c int
SET @i=1
SET @c=0
WHILE charindex(@s, @p, @i)>0
BEGIN
SET @i=charindex(@s, @p, @i)+1
SET @c=@c+1
END
SET @counter=  @c
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

