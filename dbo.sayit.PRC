SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE PROCEDURE sayit (@s VARCHAR(255))
 AS
declare @o int, @ret int
exec sp_oacreate 'speech.voicetext', @o out
exec sp_oamethod @o, 'register', NULL, 'say', 'this'
exec sp_OAGetProperty @o,'Enabled', @ret OUTPUT
if @ret=0 
	BEGIN
	print'voice text capability is disabled'
	return
	END
exec sp_oasetproperty @o, 'speed', 150
exec sp_oamethod @o, 'speak', NULL, @s, 528
exec sp_OAGetProperty @o,'isspeaking', @ret OUTPUT
WHILE @ret=1
	BEGIN
	waitfor delay '00:00:01'
	exec sp_OAGetProperty @o,'isspeaking', @ret OUTPUT
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

