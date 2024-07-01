local sprite = app.sprite
if not sprite then return app.alert "No active sprite" end

local path = sprite.filename
local fileTitle = app.fs.fileTitle(path)

Save = app.command.SaveFile
Repeat = app.command.RepeatLastExport
SaveAs = app.command.SaveFileCopyAs

Save(path)
Repeat(path)

local newSprite = app.sprite
local newFile = newSprite.filename
local exportFile = app.fs.joinPath(app.fs.filePath(newFile), fileTitle..'.png')

SaveAs{filename=exportFile}
newSprite:close()
