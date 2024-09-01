
class Hakurankaidata {
  const Hakurankaidata({
   // required this.image,
    required this.classname,
    required this.title,
    required this.place,
    required this.detail,
  });

  //final String image;
  final String classname;
  final String title;
  final String place;
  final String detail;
}

class HakurankaidataList {
  List<Hakurankaidata> hakurankaidata = [
   const Hakurankaidata(title: '未知との出会い！こじ開けよう！', place: '中棟3階101教室', detail: '24世紀、地球のエネルギー源は枯渇したー新たな活路を見出すため、地下、そして宇宙へと踏み出すプロジェクトが実行される。未知の「扉」をこじ開ける覚悟のある者は、今すぐ101号室へ！', classname: '101'),
   const Hakurankaidata(title: '変な102号室', place: '中棟3階102教室', detail: '「あなたはこのマンションの一室の異常さがわかるだろうか」ウーケッツから請け負う依頼。変な間取り図、異様な家から真実を探せ！1年2組が仕掛けるミステリーにあなたは気づけるのか！', classname: '102'),
   const Hakurankaidata(title: 'moveる美術館', place: '中棟3階103教室', detail: '初めまして、moveる美術館でございます。当館には、かの高名な「モナ・リザ」などが所蔵されております。それもなんと、"動くモナ・リザ"が。世にも珍しい、動く美術館へようこそ…', classname: '103'),
   const Hakurankaidata(title: 'お空の彼方へさぁ行くぞ！', place: '中棟3階104教室', detail: '空の冒険をコンセプトにして、縁日の定番ゲームと、パーセントバルーンを制作し融合した体験型の展示が104に降臨！あなたをお空の冒険へと案内します！', classname: '104'),
   const Hakurankaidata(title: 'Produce 105', place: '中棟3階105教室', detail: '向陽で活躍するための数々の試練を乗り越え成長していく10人の練習生たち。激しい競争の中で選ばれた5人だけがデビューの夢を掴むことができる。はたして向陽を担っていくのは誰になるのか。', classname: '105'),
   const Hakurankaidata(title: 'カジカジのコジノ', place: '中棟3階106教室', detail: '今宵は人生を賭けませんか？ルーレット、チンチロ、ブラックジャックと中に入るとそこはカジノの世界。「カジカジのコジノ」で人生を一発大逆転！！ぜひ106教室に一稼ぎしに来てください。', classname: '106'),
   const Hakurankaidata(title: '今日は全力！〇〇さんと〇〇くん', place: '中棟3階107教室', detail: '１０７がテレビ局に！？ミッション「ゲストとして番組に出演せよ！」スタジオで繰り広げられるゲームに即席のチームで勝利を目指せ！あなたもテレビタレントになってみよう！会場は３階西端！', classname: '107'),
   const Hakurankaidata(title: 'おさめのジョーズ', place: '中棟4階108教室', detail: 'ボートツアーに参加したあなたは、突如として復活した人喰いサメに襲われてしまう。あなたはサメを倒し、生還することができるだろうか？生死をさまようシューティングゲーム！', classname: '108'),
   const Hakurankaidata(title: '四階ウォッチ', place: '中棟4階109教室', detail: '不思議で奇妙な妖怪たちが109にやってくる！さまざまなクエストをクリアすると妖怪たちが仲間になってくれるかも…。妖怪の力を借りてゲームを攻略せよ！妖怪たちがあなたを待っている！', classname: '109'),
   const Hakurankaidata(title: 'メルヘン・コーポレーション', place: '中棟2階201教室', detail: '童話ールドの大企業メルヘン・コーポレーションで起こる殺人事件。犯人のあなたは、協力者と会社からの脱出を図る。犯人目線で物語が進む脱出ミステリー。さて、あなたは脱出できるだろうか...', classname: '201'),
   const Hakurankaidata(title: 'VS山風', place: '中棟2階202教室', detail: 'あの人気アイドルグループのバラエティ番組が202に帰ってくる！？お馴染みのあのゲームが君を待っている！さあ、君もテレビの世界に飛び込んで体験してみよう！', classname: '202'),
   const Hakurankaidata(title: '時空管理人', place: '中棟2階203教室', detail: '平将門の怨霊が日本の歴史を無茶苦茶にしてしまった！歴史を元に戻すため、君たち時空管理人の力が必要だ！古代から平安時代、江戸時代、明治時代を渡り歩き、平将門の怨霊を鎮めるのだ！', classname: '203'),
   const Hakurankaidata(title: '絶望の放課後', place: '中棟2階204教室', detail: '"ふとした好奇心で放課後集まって肝試しをすることになった生徒4人。楽しい夏の思い出になるはずだったのに夜の学校には誰かいてー204の新感覚ホラー映画,あなたは耐えられるか？', classname: '204'),
   const Hakurankaidata(title: 'モンスターズ・イン・205', place: '中棟2階205教室', detail: 'あのモンスターズインクの世界が205に出現！？3つの部屋に用意されたミニゲームをクリアして悲鳴ポイントを稼ぎまくろう！さあ今こそ、扉を開いてモンスターズ・イン・205の世界へ！', classname: '205'),
   const Hakurankaidata(title: 'ベイシックス', place: '中棟4階大講義室', detail: 'ベイマックスのハッピーライドをモデルにして作ったベイシックス。一度乗ったら何度でも乗りたくなる、そんな、206の力を集結させて作り上げたアトラクションをぜひ体験しに来て下さい！', classname: '206'),
   const Hakurankaidata(title: 'STAR BATTLES ', place: '北棟4階207教室', detail: '遠い昔　はるかかなたの銀河系でダースベイダー率いる帝国軍の巨大兵器デス•スターにより銀河が危険にさらされている！あなたは敵からの攻撃をかわしこの巨大兵器を破壊することが出来るのか！', classname: '207'),
   const Hakurankaidata(title: '接客態度の悪いカジノ', place: '北棟4階208教室', detail: '我々が提供するエンターテインメントは他と一味違います。それは「接客態度の悪さ」。ディーラーの態度に屈することなく会場で待っている賭けに勝利し、カジノを存分に楽しんでいってください！', classname: '208'),
   const Hakurankaidata(title: 'シューティング・ラッシュ', place: '北棟4階209教室', detail: 'あなたも主人公？！突然のバグによってゲームの世界に入り込んじゃった！トロッコに乗ってミニゲームに挑戦し、バグの世界から脱出しよう！', classname: '209'),
  ];
}

class Clubdata {
  Clubdata({required this.title,required this.place,required this.club});
  final String title;
  final String place;
  final String club;
}

class ClubdataList {
  List<Clubdata> clubdata = [
    Clubdata(title: 'カテケン工房へようこそ', place: 'LL教室',club: '家庭研究部'),
    Clubdata(title: '世界のおすすめ', place: 'LL教室',club: '英会話部'),
    Clubdata(title: 'おいでよ美術部展覧会', place: '美術室',club: '美術部'),
    Clubdata(title: '写真部2024', place: '多目的４',club: '写真部'),
    Clubdata(title: '部誌配ります', place: '多目的４',club: '文芸部'),
    Clubdata(title: 'ちょっと一息しませんか?', place: 'ゼミ室(土曜のみ)',club: '茶道部'),
  ];
}

class Ichirandata {

  Ichirandata({required this.classname,required this.title, required this.detail});
  final String title;
  final String detail;
  final String classname;
}

class IchirandataList {
  List<Ichirandata> ichirandata = [
   Ichirandata(title: 'Zoo to Peer', detail: 'ウサギ初の警察官、ジュディは詐欺師のキツネ、ニックを巻き込み誘拐事件を追うが...そこにはズートピアを取り巻く陰謀が!?301が贈るスリル満点の爽快アドベンチャー！迫真のラストシーンも!!', classname: '301'),
   Ichirandata(title: 'リメンバーミー', detail: 'ミュージシャンを夢見る少年ミゲル。しかし音楽を家族に禁じられていたミゲルは家を飛び出し死者の国へと迷い込む。それは、時を超えて家族をつなぐ、奇跡の物語の始まりだった。', classname: '302'),
   Ichirandata(title: "Cinderella's dream", detail: '原作とは違う感動を！シンデレラは仕立て屋になる夢を抱くが、女性への偏見により苦悩する。王子は政略結婚ではなく真実の愛を望むが、古い慣習によりそれも叶わない。彼らの運命はいかに！？', classname: '303'),
   Ichirandata(title: 'B4CKTOTHEFUTURE', detail: 'マーティーは知り合いの博士であるドクにタイムマシン「デロリアン」を見せてもらうが、その後ドクは殺されてしまう。マーティーはデロリアンを使ってドクの運命を変えることができるのか！？', classname: '304'),
   Ichirandata(title: '美女と野獣－魔法のものがたり－', detail: '読書好きだけど風変わりと言われ、どこか町に馴染めない美女ベル。意地の悪い性格のため魔女によって醜い姿へ変えられた野獣。バラの花びらが落ちる前に愛し合い、魔法を解くことができるのか。', classname: '305'),
   Ichirandata(title: 'Circle of Life', detail: '若きライオンの王子シンバは、王になる運命にある。 しかし、シンバの邪悪な叔父スカーは王位を奪取するため彼を殺そうと企んで...壮大なスケールの動物たちと迫力のある歌声にも注目です！！', classname: '306'),
   Ichirandata(title: "Pirates'Treasure", detail: '俺の名はキャプテン・ジャック・スパロウ。おいおい、そんなに怖がらなくても何もしねえぜ？俺達はそこらの海賊とは違うんだ。おわかり？さあ、そろそろ次の''お宝''を頂戴しに行くとするかーー', classname: '307'),
   Ichirandata(title: 'S!NG', detail: '聞いて！ムーンが歌のコンテストを開催するみたい！でも、集まったシンガーたちはそれぞれ何か悩みを抱えている。コンテストは上手くいくのかな…？劇場でみんなを見守っていてほしい！', classname: '308'),
   Ichirandata(title: 'アラジン', detail: '「自由」と「未来」を求める青年と王女、そして魔神。熱砂の王宮で暗躍するのは野心を持った1人の男。神秘と魅惑の都、アグラバーで１つのランプが運命を変える。', classname: '309'),
  ];
}

class Firstdata {
  Firstdata({required this.classname,required this.title,required this.time,required this.detail});
  final String title;
  final String time;
  final String detail;
  final String classname;
}

class FirstdataList {
  List<Firstdata> firstdata = [
   Firstdata(time : "9:40",title: "Cinderella's dream", detail: '原作とは違う感動を！シンデレラは仕立て屋になる夢を抱くが、女性への偏見により苦悩する。王子は政略結婚ではなく真実の愛を望むが、古い慣習によりそれも叶わない。彼らの運命はいかに！？', classname: '303'),
   Firstdata(time : "10:20",title: 'B4CKTOTHEFUTURE', detail: 'マーティーは知り合いの博士であるドクにタイムマシン「デロリアン」を見せてもらうが、その後ドクは殺されてしまう。マーティーはデロリアンを使ってドクの運命を変えることができるのか！？', classname: '304'),
   Firstdata(time : "11:00",title: 'S!NG', detail: '聞いて！ムーンが歌のコンテストを開催するみたい！でも、集まったシンガーたちはそれぞれ何か悩みを抱えている。コンテストは上手くいくのかな…？劇場でみんなを見守っていてほしい！', classname: '308'),
   Firstdata(time : "11:40",title: "Pirates'Treasure", detail: '俺の名はキャプテン・ジャック・スパロウ。おいおい、そんなに怖がらなくても何もしねえぜ？俺達はそこらの海賊とは違うんだ。おわかり？さあ、そろそろ次の''お宝''を頂戴しに行くとするかーー', classname: '307'),
   Firstdata(time : "12:20",title: '美女と野獣－魔法のものがたり－', detail: '読書好きだけど風変わりと言われ、どこか町に馴染めない美女ベル。意地の悪い性格のため魔女によって醜い姿へ変えられた野獣。バラの花びらが落ちる前に愛し合い、魔法を解くことができるのか。', classname: '305'),
   Firstdata(time : "13:00",title: 'アラジン', detail: '「自由」と「未来」を求める青年と王女、そして魔神。熱砂の王宮で暗躍するのは野心を持った1人の男。神秘と魅惑の都、アグラバーで１つのランプが運命を変える。', classname: '309'),
   Firstdata(time : "13:40",title: 'リメンバーミー', detail: 'ミュージシャンを夢見る少年ミゲル。しかし音楽を家族に禁じられていたミゲルは家を飛び出し死者の国へと迷い込む。それは、時を超えて家族をつなぐ、奇跡の物語の始まりだった。', classname: '302'),
   Firstdata(time : "14:20",title: 'Circle of Life', detail: '若きライオンの王子シンバは、王になる運命にある。 しかし、シンバの邪悪な叔父スカーは王位を奪取するため彼を殺そうと企んで...壮大なスケールの動物たちと迫力のある歌声にも注目です！！', classname: '306'),
   Firstdata(time : "15:00",title: 'Zoo to Peer', detail: 'ウサギ初の警察官、ジュディは詐欺師のキツネ、ニックを巻き込み誘拐事件を追うが...そこにはズートピアを取り巻く陰謀が!?301が贈るスリル満点の爽快アドベンチャー！迫真のラストシーンも!!', classname: '301'),
  ];
}

class Seconddata {
  Seconddata({required this.classname,required this.title,required this.time,required this.detail});
  final String title;
  final String time;
  final String detail;
  final String classname;
}

class SeconddataList {
  List<Seconddata> seconddata = [
   Seconddata(time : "9:10",title: 'Zoo to Peer', detail: 'ウサギ初の警察官、ジュディは詐欺師のキツネ、ニックを巻き込み誘拐事件を追うが...そこにはズートピアを取り巻く陰謀が!?301が贈るスリル満点の爽快アドベンチャー！迫真のラストシーンも!!', classname: '301'),
   Seconddata(time : "9:50",title: 'Circle of Life', detail: '若きライオンの王子シンバは、王になる運命にある。 しかし、シンバの邪悪な叔父スカーは王位を奪取するため彼を殺そうと企んで...壮大なスケールの動物たちと迫力のある歌声にも注目です！！', classname: '306'),
   Seconddata(time : "10:30",title: 'リメンバーミー', detail: 'ミュージシャンを夢見る少年ミゲル。しかし音楽を家族に禁じられていたミゲルは家を飛び出し死者の国へと迷い込む。それは、時を超えて家族をつなぐ、奇跡の物語の始まりだった。', classname: '302'),
   Seconddata(time : "11:10",title: "Cinderella's dream", detail: '原作とは違う感動を！シンデレラは仕立て屋になる夢を抱くが、女性への偏見により苦悩する。王子は政略結婚ではなく真実の愛を望むが、古い慣習によりそれも叶わない。彼らの運命はいかに！？', classname: '303'),
   Seconddata(time : "11:50",title: 'アラジン', detail: '「自由」と「未来」を求める青年と王女、そして魔神。熱砂の王宮で暗躍するのは野心を持った1人の男。神秘と魅惑の都、アグラバーで１つのランプが運命を変える。', classname: '309'),
   Seconddata(time : "12:30",title: 'B4CKTOTHEFUTURE', detail: 'マーティーは知り合いの博士であるドクにタイムマシン「デロリアン」を見せてもらうが、その後ドクは殺されてしまう。マーティーはデロリアンを使ってドクの運命を変えることができるのか！？', classname: '304'),
   Seconddata(time : "13:10",title: '美女と野獣－魔法のものがたり－', detail: '読書好きだけど風変わりと言われ、どこか町に馴染めない美女ベル。意地の悪い性格のため魔女によって醜い姿へ変えられた野獣。バラの花びらが落ちる前に愛し合い、魔法を解くことができるのか。', classname: '305'),
   Seconddata(time : "13:50",title: 'S!NG', detail: '聞いて！ムーンが歌のコンテストを開催するみたい！でも、集まったシンガーたちはそれぞれ何か悩みを抱えている。コンテストは上手くいくのかな…？劇場でみんなを見守っていてほしい！', classname: '308'),
   Seconddata(time : "14:30",title: "Pirates'Treasure", detail: '俺の名はキャプテン・ジャック・スパロウ。おいおい、そんなに怖がらなくても何もしねえぜ？俺達はそこらの海賊とは違うんだ。おわかり？さあ、そろそろ次の''お宝''を頂戴しに行くとするかーー', classname: '307'),
  ];
}