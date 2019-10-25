日本語
１．	解析対象の遺伝子リスト（~.txt）を作成する。
２．	解析対象の遺伝子リスト（~.txt）を作業用dirctory（./解凍先/input）に保存する。
３．	keggocphylogenetic_profiling_20191021_1.rbを実行するとDirectory（./解凍先/output）にビットパターンが書かれたテキストファイルが生成される。（ruby 2.3.3p222 (2016-11-21 revision 56859)）
４．	1_clstring_heatmap.r(R言語)を作業用dirctory（./解凍先/output）で実行する事によりクラスタリング結果を取得する。（R x64 3.2.5）
?
英語
1. Create a list of genes to be analyzed (~ .txt).
2. Save the analysis target gene list (~ .txt) in the working dirctory (./decompression destination / input).
3. When keggocphylogenetic_profiling_20191021_1.rb is executed, a text file with a bit pattern written in Directory (./decompression destination / output) is generated. (Ruby 2.3.3p222 (2016-11-21 revision 56859))
4). The clustering result is acquired by executing 1_clstring_heatmap.r (R language) with the working dirctory (./decompression destination / output). (R x64 3.2.5)

