# Chinese character lists

Each .csv with `char`, `level` and possibly extra columns. See `chars.ipynb` for more details and statistics.

**Traditional (TW)**

- `tocfl.csv`: characters by TOCFL 2022/2023 wordlist levels.
- `tocfl-2018.csv`: characters by TOCFL 2018 wordlist levels.
- `cccc.csv`: characters by CCCC 2022 wordlist levels.
- `tbcl-chars.csv`: characters by TBCL character level.
- `tbcl-words.csv`: characters by TBCL wordlist level, a bit different from character list.
- `tw.csv`: characters by taiwanese school textbooks grade from a [random unofficial source](https://web.archive.org/web/20111215143140/http://residence.educities.edu.tw/wei3128/currinstruc/wordclause/generwordgrd9.htm).
- `dangdai.csv`, `modernchinese.csv`, `pavc.csv`: characters in taiwanese mandarin textbooks (level = book number in series).

**Traditional (HK)**

- `hk-unihan.csv`: characters by Hong Kong primary grade level from Unihan's kGradeLevel (incomplete!)
- `hk-3171.csv`: current HK primary school list (香港小學學習字詞表) of 3171 characters, no levels.

**Simplified**

- `tgh.csv`: [Table of General Standard Chinese Characters](https://en.wikipedia.org/wiki/Table_of_General_Standard_Chinese_Characters) ([通用规范汉字表](https://www.gov.cn/gzdt/att/att/site1/20130819/tygfhzb.pdf), Tōngyòng Guīfàn Hànzì Biǎo), 8105 characters over 3 broad levels.
  - Official standard list of common simplified characters by PRC's Ministry of Education (2013).
  - Data from [Unihan](https://www.unicode.org/reports/tr38/#kTGH) database, including pinyin readings.
- `hsk30.csv`: characters in HSK 3.0 wordlist by level at which they first appear
- `cn2460.csv`: random unofficial list "小学1-6年级生字表" from the internet, ~2460 simplified characters by 6 primary school grades.

**Misc**

Not exactly chinese but interesting/close enough to traditional characters to be useful:

- `kanji.csv`: 2136 japanese kanji by school grade levels. Grade levels (2020) from [wikipedia](https://en.wikipedia.org/wiki/List_of_j%C5%8Dy%C5%8D_kanji), characters cross-referenced against Unihan's kJoyoKanji.
- `hanja.csv`: 1800 [korean educational hanjas](https://en.wikipedia.org/wiki/Basic_Hanja_for_educational_use) over two levels (grades 7-9 / 10-12). Data from Unihan's kKoreanEducationHanja + [wikipedia](https://ko.wikipedia.org/wiki/%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD_%EC%A4%91%EA%B3%A0%EB%93%B1%ED%95%99%EA%B5%90_%EA%B8%B0%EC%B4%88%ED%95%9C%EC%9E%90_%EB%AA%A9%EB%A1%9D).
