# Chinese character lists

Each .csv with `char`, `level` and possibly extra columns. See `chars.ipynb` for more details and statistics.

**Traditional (TW)**

- `tocfl.csv`: 2562 characters by TOCFL 2022/2023 wordlist levels.
- `tocfl-2018.csv`: 2555 characters by TOCFL 2018 wordlist levels.
- `cccc.csv`: 1046 characters by CCCC 2022 wordlist levels.
- `tbcl-chars.csv`: 3133 (incl. variants) characters, TBCL characters list.
- `tbcl-words.csv`: 3574 characters by TBCL *wordlist* level, a bit different from their official character list.
- `tw.csv`: 5568 characters by taiwanese school textbooks grade from a [random unofficial source](https://web.archive.org/web/20111215143140/http://residence.educities.edu.tw/wei3128/currinstruc/wordclause/generwordgrd9.htm).
- `dangdai.csv`, `modernchinese.csv`, `pavc.csv`: ~1600-2200 characters in taiwanese mandarin textbooks by book number (first book usually CEFR A1-A2, second=A2-B1, etc.)

**Traditional (HK)**

- `hk-unihan.csv`: 2632 characters by six Hong Kong primary grade levels from Unihan's [kGradeLevel](https://www.unicode.org/reports/tr38/#kGradeLevel).
  - Note: very incomplete list! Many basic characters missing, e.g. 書.
- `hk-3171.csv`: 3171 characters from current HK primary school list ([香港小學學習字詞表](https://www.edbchinese.hk/lexlist_ch/)), no level extracted.

**Simplified**

- `tgh.csv`: 8105 characters of **T**ongyong **G**uifan **H**anzi Biao ([通用规范汉字表](https://www.gov.cn/gzdt/att/att/site1/20130819/tygfhzb.pdf), [Table of General Standard Chinese Characters](https://en.wikipedia.org/wiki/Table_of_General_Standard_Chinese_Characters), official PRC standard), 3 broad levels. Data from [Unihan](https://www.unicode.org/reports/tr38/#kTGH) including pinyin.
- `hsk30.csv`: 3000 HSK 3.0 characters (incl. 29 extra L7 chars outside wordlist).**
  - `hsk30-writing.csv`: 1200 characters by one of three indicated HSK 3.0 writing levels.
  - `hsk30-*-trad.csv`: versions with traditional chars.
- `cn2460.csv`: ~2460 characters by 6 primary school grades from a random unofficial list "小学1-6年级生字表" from the internet. No official country-wide lists otherwise - up to local schools systems. Almost all are TGH level 1.

**Misc**

Not exactly chinese but interesting/close enough to traditional characters to be useful:

- `kanji.csv`: 2136 [japanese joyo kanji](https://en.wikipedia.org/wiki/List_of_j%C5%8Dy%C5%8D_kanji) by school grade levels. Grade levels (2020) from [wikipedia](https://en.wikipedia.org/wiki/List_of_j%C5%8Dy%C5%8D_kanji), characters cross-referenced against Unihan's kJoyoKanji.
- `hanja.csv`: 1800 [korean educational hanjas](https://en.wikipedia.org/wiki/Basic_Hanja_for_educational_use) over two levels (grades 7-9 / 10-12). Data from Unihan's kKoreanEducationHanja + [wikipedia](https://ko.wikipedia.org/wiki/%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD_%EC%A4%91%EA%B3%A0%EB%93%B1%ED%95%99%EA%B5%90_%EA%B8%B0%EC%B4%88%ED%95%9C%EC%9E%90_%EB%AA%A9%EB%A1%9D).
