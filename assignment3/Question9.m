function[First,Long,Last]=Question9(InputWord)
Long=strlength(InputWord);
First=cellfun(@(c) c(1),strsplit(InputWord));
Last=InputWord(end);
end 