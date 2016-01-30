----------------------------------------------------------------
----------------------------------------------------------------
-- AUTHOR: Richard Guy --
-- DATE: January 30, 2016 --
-- PURPOSE: Will lowercase all of your tags in Evernote --
----------------------------------------------------------------
----------------------------------------------------------------


----------------------------------------------------------------
----------------------------------------------------------------
-- IMPORTANT TO BACKUP YOUR NOTES FIRST --

-- * Open Evernote --
-- * Go to the File menu --
-- * Export All Notes --
----------------------------------------------------------------
----------------------------------------------------------------


----------------------------------------------------------------
-- This change_case function is from: --
-- http://www.mindingthegaps.com/blog/2011/05/26/applescript-converting-uppercase-lowercase-applescrunix-style/ --
----------------------------------------------------------------
on change_case(this_text, this_case)
	if this_case is "lower" then
		set the comparison_string to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
		set the source_string to "abcdefghijklmnopqrstuvwxyz"
	else
		set the comparison_string to "abcdefghijklmnopqrstuvwxyz"
		set the source_string to "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	end if
	set the new_text to ""
	repeat with thisChar in this_text
		set x to the offset of thisChar in the comparison_string
		if x is not 0 then
			set the new_text to (the new_text & character x of the source_string) as string
		else
			set the new_text to (the new_text & thisChar) as string
		end if
	end repeat
	return the new_text
end change_case

tell application "Evernote"
	
	-- get all evernote tags --
	set allTags to tags
	
	-- loop through each tag --
	repeat with aTag in allTags
		
		-- get the name of the tag --
		set tagName to name of aTag
		
		-- convert name of tag to a string --
		set tagNameAsString to tagName as string
		
		-- lowercase the name of the tag --
		set lowercaseTagName to my change_case(the tagNameAsString, "lower")
		
		-- log out the before and after --
		log tagNameAsString
		log lowercaseTagName
		
		-- rename the tag in evernote --
		set name of tag tagNameAsString to lowercaseTagName
		
	end repeat
end tell
